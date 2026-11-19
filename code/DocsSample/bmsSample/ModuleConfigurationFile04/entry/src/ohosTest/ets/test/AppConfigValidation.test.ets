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
import type { AppConfig } from '../harness/ConfigModels';
import { AppConfigValidator } from '../harness/AppConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { ConfigFactory } from '../harness/ConfigFactory';
import { NameUtils } from '../harness/NameUtils';
import { FindingReport } from '../harness/FindingReport';
export default function AppConfigValidationTest(): void {
  describe('AppConfigValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1000
     * @tc.name      testAppBundleNameEmpty
     * @tc.desc      Checks that the an empty bundle name is reported with APP_BUNDLE_NAME_EMPTY by the
     * @tc.desc      bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = '';
      TestLog.text('testAppBundleNameEmpty', 'case begin', 'bundleName input empty');
      TestLog.step('testAppBundleNameEmpty', 'bundleName input empty');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameEmpty', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppBundleNameEmpty', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameEmpty', 'case end', 'bundleName input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1001
     * @tc.name      testAppBundleNameBlank
     * @tc.desc      Checks that the a blank bundle name is reported with APP_BUNDLE_NAME_EMPTY by the
     * @tc.desc      bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = '   ';
      TestLog.text('testAppBundleNameBlank', 'case begin', 'bundleName input blank');
      TestLog.step('testAppBundleNameBlank', 'bundleName input blank');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameBlank', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppBundleNameBlank', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameBlank', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameBlank', 'case end', 'bundleName input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1002
     * @tc.name      testAppBundleNameTooLong
     * @tc.desc      Checks that the a bundle name longer than the maximum length is reported with
     * @tc.desc      APP_BUNDLE_NAME_TOO_LONG by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = NameUtils.repeat('a', 129);
      TestLog.text('testAppBundleNameTooLong', 'case begin', 'bundleName input toolong');
      TestLog.step('testAppBundleNameTooLong', 'bundleName input toolong');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameTooLong', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_LONG');
      TestLog.flag('testAppBundleNameTooLong', 'has code APP_BUNDLE_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameTooLong', 'case end', 'bundleName input toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1003
     * @tc.name      testAppBundleNameTooFewSegments
     * @tc.desc      Checks that the a bundle name with a single segment is reported with
     * @tc.desc      APP_BUNDLE_NAME_TOO_FEW_SEGMENTS by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameTooFewSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohosapp';
      TestLog.text('testAppBundleNameTooFewSegments', 'case begin', 'bundleName input toofewsegments');
      TestLog.step('testAppBundleNameTooFewSegments', 'bundleName input toofewsegments');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameTooFewSegments', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppBundleNameTooFewSegments', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameTooFewSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameTooFewSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameTooFewSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameTooFewSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameTooFewSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameTooFewSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameTooFewSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameTooFewSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameTooFewSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameTooFewSegments', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameTooFewSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameTooFewSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameTooFewSegments', 'case end', 'bundleName input toofewsegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1004
     * @tc.name      testAppBundleNameUppercase
     * @tc.desc      Checks that the a bundle name containing upper case letters is reported with
     * @tc.desc      APP_BUNDLE_NAME_UPPERCASE by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameUppercase',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.MyApplication';
      TestLog.text('testAppBundleNameUppercase', 'case begin', 'bundleName input uppercase');
      TestLog.step('testAppBundleNameUppercase', 'bundleName input uppercase');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameUppercase', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppBundleNameUppercase', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameUppercase', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameUppercase', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameUppercase', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameUppercase', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameUppercase', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameUppercase', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameUppercase', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameUppercase', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameUppercase', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameUppercase', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameUppercase', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameUppercase', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameUppercase', 'case end', 'bundleName input uppercase');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1005
     * @tc.name      testAppBundleNameWhitespace
     * @tc.desc      Checks that the a bundle name containing inner whitespace is reported with
     * @tc.desc      APP_BUNDLE_NAME_WHITESPACE by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos.app hap.myapplication';
      TestLog.text('testAppBundleNameWhitespace', 'case begin', 'bundleName input whitespace');
      TestLog.step('testAppBundleNameWhitespace', 'bundleName input whitespace');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameWhitespace', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppBundleNameWhitespace', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameWhitespace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameWhitespace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameWhitespace', 'case end', 'bundleName input whitespace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1006
     * @tc.name      testAppBundleNameTrailingSpace
     * @tc.desc      Checks that the a bundle name normalized by trimming trailing whitespace is accepted by
     * @tc.desc      the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameTrailingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.myapplication ';
      TestLog.text('testAppBundleNameTrailingSpace', 'case begin', 'bundleName input trailingspace');
      TestLog.step('testAppBundleNameTrailingSpace', 'bundleName input trailingspace');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameTrailingSpace', 'bundleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppBundleNameTrailingSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameTrailingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameTrailingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameTrailingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameTrailingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameTrailingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameTrailingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameTrailingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameTrailingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameTrailingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameTrailingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameTrailingSpace', 'case end', 'bundleName input trailingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1007
     * @tc.name      testAppBundleNameLeadingDot
     * @tc.desc      Checks that the a bundle name starting with a dot is reported with
     * @tc.desc      APP_BUNDLE_NAME_EMPTY_SEGMENT by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameLeadingDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = '.ohos.app.hap';
      TestLog.text('testAppBundleNameLeadingDot', 'case begin', 'bundleName input leadingdot');
      TestLog.step('testAppBundleNameLeadingDot', 'bundleName input leadingdot');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameLeadingDot', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppBundleNameLeadingDot', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameLeadingDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameLeadingDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameLeadingDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameLeadingDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameLeadingDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameLeadingDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameLeadingDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameLeadingDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameLeadingDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameLeadingDot', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameLeadingDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameLeadingDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameLeadingDot', 'case end', 'bundleName input leadingdot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1008
     * @tc.name      testAppBundleNameTrailingDot
     * @tc.desc      Checks that the a bundle name ending with a dot is reported with
     * @tc.desc      APP_BUNDLE_NAME_EMPTY_SEGMENT by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameTrailingDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.';
      TestLog.text('testAppBundleNameTrailingDot', 'case begin', 'bundleName input trailingdot');
      TestLog.step('testAppBundleNameTrailingDot', 'bundleName input trailingdot');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameTrailingDot', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppBundleNameTrailingDot', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameTrailingDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameTrailingDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameTrailingDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameTrailingDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameTrailingDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameTrailingDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameTrailingDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameTrailingDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameTrailingDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameTrailingDot', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameTrailingDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameTrailingDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameTrailingDot', 'case end', 'bundleName input trailingdot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1009
     * @tc.name      testAppBundleNameConsecutiveDots
     * @tc.desc      Checks that the a bundle name with consecutive dots is reported with
     * @tc.desc      APP_BUNDLE_NAME_EMPTY_SEGMENT by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameConsecutiveDots',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos..hap.app';
      TestLog.text('testAppBundleNameConsecutiveDots', 'case begin', 'bundleName input consecutivedots');
      TestLog.step('testAppBundleNameConsecutiveDots', 'bundleName input consecutivedots');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameConsecutiveDots', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppBundleNameConsecutiveDots', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameConsecutiveDots', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameConsecutiveDots', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameConsecutiveDots', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameConsecutiveDots', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameConsecutiveDots', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameConsecutiveDots', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameConsecutiveDots', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameConsecutiveDots', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameConsecutiveDots', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameConsecutiveDots', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameConsecutiveDots', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameConsecutiveDots', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameConsecutiveDots', 'case end', 'bundleName input consecutivedots');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1010
     * @tc.name      testAppBundleNameHyphen
     * @tc.desc      Checks that the a bundle name containing a hyphen is reported with
     * @tc.desc      APP_BUNDLE_NAME_ILLEGAL_CHAR by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos.app-hap.myapplication';
      TestLog.text('testAppBundleNameHyphen', 'case begin', 'bundleName input hyphen');
      TestLog.step('testAppBundleNameHyphen', 'bundleName input hyphen');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameHyphen', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppBundleNameHyphen', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameHyphen', 'case end', 'bundleName input hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1011
     * @tc.name      testAppBundleNameSlash
     * @tc.desc      Checks that the a bundle name containing slashes is reported with
     * @tc.desc      APP_BUNDLE_NAME_ILLEGAL_CHAR by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameSlash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos/app/hap';
      TestLog.text('testAppBundleNameSlash', 'case begin', 'bundleName input slash');
      TestLog.step('testAppBundleNameSlash', 'bundleName input slash');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameSlash', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppBundleNameSlash', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameSlash', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameSlash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameSlash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameSlash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameSlash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameSlash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameSlash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameSlash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameSlash', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameSlash', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameSlash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameSlash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameSlash', 'case end', 'bundleName input slash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1012
     * @tc.name      testAppBundleNameDollar
     * @tc.desc      Checks that the a bundle name containing a dollar sign is reported with
     * @tc.desc      APP_BUNDLE_NAME_ILLEGAL_CHAR by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameDollar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.my$application';
      TestLog.text('testAppBundleNameDollar', 'case begin', 'bundleName input dollar');
      TestLog.step('testAppBundleNameDollar', 'bundleName input dollar');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameDollar', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppBundleNameDollar', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameDollar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameDollar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameDollar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameDollar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameDollar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameDollar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameDollar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameDollar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameDollar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameDollar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameDollar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameDollar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameDollar', 'case end', 'bundleName input dollar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1013
     * @tc.name      testAppBundleNameSegmentLeadingDigit
     * @tc.desc      Checks that the a bundle name segment starting with a digit is reported with
     * @tc.desc      APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameSegmentLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos.1app.hap';
      TestLog.text('testAppBundleNameSegmentLeadingDigit', 'case begin', 'bundleName input segmentleadingdigit');
      TestLog.step('testAppBundleNameSegmentLeadingDigit', 'bundleName input segmentleadingdigit');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameSegmentLeadingDigit', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppBundleNameSegmentLeadingDigit',
        'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameSegmentLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameSegmentLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameSegmentLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameSegmentLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameSegmentLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameSegmentLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameSegmentLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameSegmentLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameSegmentLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameSegmentLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameSegmentLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameSegmentLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameSegmentLeadingDigit', 'case end', 'bundleName input segmentleadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1014
     * @tc.name      testAppBundleNameNumericSegment
     * @tc.desc      Checks that the a numeric bundle name segment is reported with
     * @tc.desc      APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameNumericSegment',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos.app.123';
      TestLog.text('testAppBundleNameNumericSegment', 'case begin', 'bundleName input numericsegment');
      TestLog.step('testAppBundleNameNumericSegment', 'bundleName input numericsegment');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameNumericSegment', 'bundleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppBundleNameNumericSegment', 'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppBundleNameNumericSegment', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameNumericSegment', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameNumericSegment', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameNumericSegment', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameNumericSegment', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameNumericSegment', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameNumericSegment', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameNumericSegment', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppBundleNameNumericSegment', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameNumericSegment', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameNumericSegment', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameNumericSegment', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameNumericSegment', 'case end', 'bundleName input numericsegment');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1015
     * @tc.name      testAppBundleNameUnderscoreValid
     * @tc.desc      Checks that the a bundle name with underscores is accepted by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameUnderscoreValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'ohos_app.hap.myapplication';
      TestLog.text('testAppBundleNameUnderscoreValid', 'case begin', 'bundleName input underscorevalid');
      TestLog.step('testAppBundleNameUnderscoreValid', 'bundleName input underscorevalid');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameUnderscoreValid', 'bundleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppBundleNameUnderscoreValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameUnderscoreValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameUnderscoreValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameUnderscoreValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameUnderscoreValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameUnderscoreValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameUnderscoreValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameUnderscoreValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameUnderscoreValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameUnderscoreValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameUnderscoreValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameUnderscoreValid', 'case end', 'bundleName input underscorevalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1016
     * @tc.name      testAppBundleNameMinimalValid
     * @tc.desc      Checks that the a two segment bundle name is accepted by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameMinimalValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'a.b';
      TestLog.text('testAppBundleNameMinimalValid', 'case begin', 'bundleName input minimalvalid');
      TestLog.step('testAppBundleNameMinimalValid', 'bundleName input minimalvalid');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameMinimalValid', 'bundleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppBundleNameMinimalValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameMinimalValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameMinimalValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameMinimalValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameMinimalValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameMinimalValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameMinimalValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameMinimalValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameMinimalValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameMinimalValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameMinimalValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameMinimalValid', 'case end', 'bundleName input minimalvalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1017
     * @tc.name      testAppBundleNameSampleValid
     * @tc.desc      Checks that the the sample bundle name is accepted by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameSampleValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.myapplication';
      TestLog.text('testAppBundleNameSampleValid', 'case begin', 'bundleName input samplevalid');
      TestLog.step('testAppBundleNameSampleValid', 'bundleName input samplevalid');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameSampleValid', 'bundleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppBundleNameSampleValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameSampleValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameSampleValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameSampleValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameSampleValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameSampleValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameSampleValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameSampleValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameSampleValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameSampleValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameSampleValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameSampleValid', 'case end', 'bundleName input samplevalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1018
     * @tc.name      testAppBundleNameDigitsValid
     * @tc.desc      Checks that the a bundle name with an inner digit is accepted by the bundleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppBundleNameDigitsValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = 'com.example.app2';
      TestLog.text('testAppBundleNameDigitsValid', 'case begin', 'bundleName input digitsvalid');
      TestLog.step('testAppBundleNameDigitsValid', 'bundleName input digitsvalid');
      const findings: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.findings('testAppBundleNameDigitsValid', 'bundleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppBundleNameDigitsValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppBundleNameDigitsValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppBundleNameDigitsValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppBundleNameDigitsValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppBundleNameDigitsValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppBundleNameDigitsValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppBundleNameDigitsValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppBundleNameDigitsValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppBundleNameDigitsValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateBundleName(appConfig);
      TestLog.number('testAppBundleNameDigitsValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppBundleNameDigitsValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppBundleNameDigitsValid', 'case end', 'bundleName input digitsvalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1019
     * @tc.name      testAppVendorEmpty
     * @tc.desc      Checks that the an empty vendor is reported with APP_VENDOR_EMPTY by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = '';
      TestLog.text('testAppVendorEmpty', 'case begin', 'vendor input empty');
      TestLog.step('testAppVendorEmpty', 'vendor input empty');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorEmpty', 'vendor', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppVendorEmpty', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVendorEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVendorEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorEmpty', 'case end', 'vendor input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1020
     * @tc.name      testAppVendorBlank
     * @tc.desc      Checks that the a blank vendor is reported with APP_VENDOR_EMPTY by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = '  ';
      TestLog.text('testAppVendorBlank', 'case begin', 'vendor input blank');
      TestLog.step('testAppVendorBlank', 'vendor input blank');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorBlank', 'vendor', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppVendorBlank', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVendorBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVendorBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorBlank', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorBlank', 'case end', 'vendor input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1021
     * @tc.name      testAppVendorTooLong
     * @tc.desc      Checks that the a vendor longer than the maximum length is reported with
     * @tc.desc      APP_VENDOR_TOO_LONG by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = NameUtils.repeat('a', 65);
      TestLog.text('testAppVendorTooLong', 'case begin', 'vendor input toolong');
      TestLog.step('testAppVendorTooLong', 'vendor input toolong');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorTooLong', 'vendor', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppVendorTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVendorTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVendorTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorTooLong', 'case end', 'vendor input toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1022
     * @tc.name      testAppVendorAtSymbol
     * @tc.desc      Checks that the a vendor with an at sign is reported with APP_VENDOR_ILLEGAL_CHAR by the
     * @tc.desc      vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorAtSymbol',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'ex@mple';
      TestLog.text('testAppVendorAtSymbol', 'case begin', 'vendor input atsymbol');
      TestLog.step('testAppVendorAtSymbol', 'vendor input atsymbol');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorAtSymbol', 'vendor', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppVendorAtSymbol', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVendorAtSymbol', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorAtSymbol', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorAtSymbol', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorAtSymbol', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorAtSymbol', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorAtSymbol', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorAtSymbol', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorAtSymbol', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVendorAtSymbol', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorAtSymbol', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorAtSymbol', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorAtSymbol', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorAtSymbol', 'case end', 'vendor input atsymbol');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1023
     * @tc.name      testAppVendorSlash
     * @tc.desc      Checks that the a vendor with a slash is reported with APP_VENDOR_ILLEGAL_CHAR by the
     * @tc.desc      vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorSlash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'example/vendor';
      TestLog.text('testAppVendorSlash', 'case begin', 'vendor input slash');
      TestLog.step('testAppVendorSlash', 'vendor input slash');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorSlash', 'vendor', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppVendorSlash', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVendorSlash', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorSlash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorSlash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorSlash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorSlash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorSlash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorSlash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorSlash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVendorSlash', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorSlash', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorSlash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorSlash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorSlash', 'case end', 'vendor input slash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1024
     * @tc.name      testAppVendorDot
     * @tc.desc      Checks that the a vendor with a dot is reported with APP_VENDOR_ILLEGAL_CHAR by the
     * @tc.desc      vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'example.vendor';
      TestLog.text('testAppVendorDot', 'case begin', 'vendor input dot');
      TestLog.step('testAppVendorDot', 'vendor input dot');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorDot', 'vendor', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppVendorDot', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVendorDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVendorDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorDot', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorDot', 'case end', 'vendor input dot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1025
     * @tc.name      testAppVendorSimple
     * @tc.desc      Checks that the the sample vendor is accepted by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorSimple',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'example';
      TestLog.text('testAppVendorSimple', 'case begin', 'vendor input simple');
      TestLog.step('testAppVendorSimple', 'vendor input simple');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorSimple', 'vendor', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVendorSimple', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorSimple', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorSimple', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorSimple', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorSimple', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorSimple', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorSimple', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorSimple', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorSimple', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorSimple', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorSimple', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorSimple', 'case end', 'vendor input simple');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1026
     * @tc.name      testAppVendorWithSpace
     * @tc.desc      Checks that the a vendor with an inner space is accepted by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorWithSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'Huawei Device';
      TestLog.text('testAppVendorWithSpace', 'case begin', 'vendor input withspace');
      TestLog.step('testAppVendorWithSpace', 'vendor input withspace');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorWithSpace', 'vendor', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVendorWithSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorWithSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorWithSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorWithSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorWithSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorWithSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorWithSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorWithSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorWithSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorWithSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorWithSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorWithSpace', 'case end', 'vendor input withspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1027
     * @tc.name      testAppVendorWithHyphen
     * @tc.desc      Checks that the a vendor with a hyphen is accepted by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorWithHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'huawei-device';
      TestLog.text('testAppVendorWithHyphen', 'case begin', 'vendor input withhyphen');
      TestLog.step('testAppVendorWithHyphen', 'vendor input withhyphen');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorWithHyphen', 'vendor', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVendorWithHyphen', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorWithHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorWithHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorWithHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorWithHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorWithHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorWithHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorWithHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorWithHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorWithHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorWithHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorWithHyphen', 'case end', 'vendor input withhyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1028
     * @tc.name      testAppVendorWithUnderscore
     * @tc.desc      Checks that the a vendor with an underscore is accepted by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorWithUnderscore',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'huawei_device';
      TestLog.text('testAppVendorWithUnderscore', 'case begin', 'vendor input withunderscore');
      TestLog.step('testAppVendorWithUnderscore', 'vendor input withunderscore');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorWithUnderscore', 'vendor', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVendorWithUnderscore', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorWithUnderscore', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorWithUnderscore', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorWithUnderscore', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorWithUnderscore', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorWithUnderscore', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorWithUnderscore', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorWithUnderscore', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorWithUnderscore', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorWithUnderscore', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorWithUnderscore', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorWithUnderscore', 'case end', 'vendor input withunderscore');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1029
     * @tc.name      testAppVendorWithDigits
     * @tc.desc      Checks that the a vendor with digits is accepted by the vendor rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVendorWithDigits',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = 'vendor2026';
      TestLog.text('testAppVendorWithDigits', 'case begin', 'vendor input withdigits');
      TestLog.step('testAppVendorWithDigits', 'vendor input withdigits');
      const findings: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.findings('testAppVendorWithDigits', 'vendor', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVendorWithDigits', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVendorWithDigits', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVendorWithDigits', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVendorWithDigits', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVendorWithDigits', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVendorWithDigits', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVendorWithDigits', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVendorWithDigits', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVendorWithDigits', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVendor(appConfig);
      TestLog.number('testAppVendorWithDigits', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVendorWithDigits', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVendorWithDigits', 'case end', 'vendor input withdigits');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1030
     * @tc.name      testAppVersionCodeZero
     * @tc.desc      Checks that the a zero version code is reported with APP_VERSION_CODE_NOT_POSITIVE by
     * @tc.desc      the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 0;
      TestLog.text('testAppVersionCodeZero', 'case begin', 'versionCode input zero');
      TestLog.step('testAppVersionCodeZero', 'versionCode input zero');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeZero', 'versionCode', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testAppVersionCodeZero', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionCodeZero', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionCodeZero', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeZero', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeZero', 'case end', 'versionCode input zero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1031
     * @tc.name      testAppVersionCodeNegative
     * @tc.desc      Checks that the a negative version code is reported with APP_VERSION_CODE_NOT_POSITIVE
     * @tc.desc      by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeNegative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = -1;
      TestLog.text('testAppVersionCodeNegative', 'case begin', 'versionCode input negative');
      TestLog.step('testAppVersionCodeNegative', 'versionCode input negative');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeNegative', 'versionCode', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testAppVersionCodeNegative', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionCodeNegative', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeNegative', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeNegative', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeNegative', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeNegative', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeNegative', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeNegative', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeNegative', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionCodeNegative', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeNegative', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeNegative', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeNegative', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeNegative', 'case end', 'versionCode input negative');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1032
     * @tc.name      testAppVersionCodeOverMax
     * @tc.desc      Checks that the a version code above the maximum value is reported with
     * @tc.desc      APP_VERSION_CODE_OUT_OF_RANGE by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeOverMax',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 2147483648;
      TestLog.text('testAppVersionCodeOverMax', 'case begin', 'versionCode input overmax');
      TestLog.step('testAppVersionCodeOverMax', 'versionCode input overmax');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeOverMax', 'versionCode', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_OUT_OF_RANGE');
      TestLog.flag('testAppVersionCodeOverMax', 'has code APP_VERSION_CODE_OUT_OF_RANGE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionCodeOverMax', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeOverMax', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeOverMax', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeOverMax', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeOverMax', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeOverMax', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeOverMax', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeOverMax', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionCodeOverMax', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeOverMax', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeOverMax', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeOverMax', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeOverMax', 'case end', 'versionCode input overmax');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1033
     * @tc.name      testAppVersionCodeHuge
     * @tc.desc      Checks that the a huge version code is reported with APP_VERSION_CODE_OUT_OF_RANGE by
     * @tc.desc      the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeHuge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 9999999999;
      TestLog.text('testAppVersionCodeHuge', 'case begin', 'versionCode input huge');
      TestLog.step('testAppVersionCodeHuge', 'versionCode input huge');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeHuge', 'versionCode', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_OUT_OF_RANGE');
      TestLog.flag('testAppVersionCodeHuge', 'has code APP_VERSION_CODE_OUT_OF_RANGE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionCodeHuge', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeHuge', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeHuge', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeHuge', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeHuge', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeHuge', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeHuge', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeHuge', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionCodeHuge', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeHuge', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeHuge', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeHuge', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeHuge', 'case end', 'versionCode input huge');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1034
     * @tc.name      testAppVersionCodeNonInteger
     * @tc.desc      Checks that the a fractional version code is reported with APP_VERSION_CODE_NOT_INTEGER
     * @tc.desc      by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeNonInteger',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 1.5;
      TestLog.text('testAppVersionCodeNonInteger', 'case begin', 'versionCode input noninteger');
      TestLog.step('testAppVersionCodeNonInteger', 'versionCode input noninteger');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeNonInteger', 'versionCode', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_INTEGER');
      TestLog.flag('testAppVersionCodeNonInteger', 'has code APP_VERSION_CODE_NOT_INTEGER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionCodeNonInteger', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeNonInteger', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeNonInteger', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeNonInteger', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeNonInteger', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeNonInteger', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeNonInteger', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeNonInteger', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionCodeNonInteger', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeNonInteger', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeNonInteger', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeNonInteger', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeNonInteger', 'case end', 'versionCode input noninteger');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1035
     * @tc.name      testAppVersionCodeNegativeFraction
     * @tc.desc      Checks that the a negative fractional version code is reported with
     * @tc.desc      APP_VERSION_CODE_NOT_INTEGER by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeNegativeFraction',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = -0.5;
      TestLog.text('testAppVersionCodeNegativeFraction', 'case begin', 'versionCode input negativefraction');
      TestLog.step('testAppVersionCodeNegativeFraction', 'versionCode input negativefraction');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeNegativeFraction', 'versionCode', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_INTEGER');
      TestLog.flag('testAppVersionCodeNegativeFraction', 'has code APP_VERSION_CODE_NOT_INTEGER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionCodeNegativeFraction', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeNegativeFraction', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeNegativeFraction', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeNegativeFraction', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeNegativeFraction', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeNegativeFraction', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeNegativeFraction', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeNegativeFraction', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionCodeNegativeFraction', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeNegativeFraction', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeNegativeFraction', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeNegativeFraction', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeNegativeFraction', 'case end', 'versionCode input negativefraction');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1036
     * @tc.name      testAppVersionCodeOne
     * @tc.desc      Checks that the the minimum version code is accepted by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeOne',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 1;
      TestLog.text('testAppVersionCodeOne', 'case begin', 'versionCode input one');
      TestLog.step('testAppVersionCodeOne', 'versionCode input one');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeOne', 'versionCode', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionCodeOne', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeOne', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeOne', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeOne', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeOne', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeOne', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeOne', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeOne', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeOne', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeOne', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeOne', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeOne', 'case end', 'versionCode input one');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1037
     * @tc.name      testAppVersionCodeMaxValid
     * @tc.desc      Checks that the the maximum version code is accepted by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeMaxValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 2147483647;
      TestLog.text('testAppVersionCodeMaxValid', 'case begin', 'versionCode input maxvalid');
      TestLog.step('testAppVersionCodeMaxValid', 'versionCode input maxvalid');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeMaxValid', 'versionCode', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionCodeMaxValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeMaxValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeMaxValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeMaxValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeMaxValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeMaxValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeMaxValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeMaxValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeMaxValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeMaxValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeMaxValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeMaxValid', 'case end', 'versionCode input maxvalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1038
     * @tc.name      testAppVersionCodeSample
     * @tc.desc      Checks that the the sample version code is accepted by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 1000000;
      TestLog.text('testAppVersionCodeSample', 'case begin', 'versionCode input sample');
      TestLog.step('testAppVersionCodeSample', 'versionCode input sample');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeSample', 'versionCode', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionCodeSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeSample', 'case end', 'versionCode input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1039
     * @tc.name      testAppVersionCodeSmallValid
     * @tc.desc      Checks that the a small version code is accepted by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeSmallValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 2;
      TestLog.text('testAppVersionCodeSmallValid', 'case begin', 'versionCode input smallvalid');
      TestLog.step('testAppVersionCodeSmallValid', 'versionCode input smallvalid');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeSmallValid', 'versionCode', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionCodeSmallValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeSmallValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeSmallValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeSmallValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeSmallValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeSmallValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeSmallValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeSmallValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeSmallValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeSmallValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeSmallValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeSmallValid', 'case end', 'versionCode input smallvalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1040
     * @tc.name      testAppVersionCodeLargeValid
     * @tc.desc      Checks that the a large version code is accepted by the versionCode rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionCodeLargeValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 999999999;
      TestLog.text('testAppVersionCodeLargeValid', 'case begin', 'versionCode input largevalid');
      TestLog.step('testAppVersionCodeLargeValid', 'versionCode input largevalid');
      const findings: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.findings('testAppVersionCodeLargeValid', 'versionCode', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionCodeLargeValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionCodeLargeValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionCodeLargeValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionCodeLargeValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionCodeLargeValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionCodeLargeValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionCodeLargeValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionCodeLargeValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionCodeLargeValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionCode(appConfig);
      TestLog.number('testAppVersionCodeLargeValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionCodeLargeValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionCodeLargeValid', 'case end', 'versionCode input largevalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1041
     * @tc.name      testAppVersionNameEmpty
     * @tc.desc      Checks that the an empty version name is reported with APP_VERSION_NAME_EMPTY by the
     * @tc.desc      versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '';
      TestLog.text('testAppVersionNameEmpty', 'case begin', 'versionName input empty');
      TestLog.step('testAppVersionNameEmpty', 'versionName input empty');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameEmpty', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testAppVersionNameEmpty', 'has code APP_VERSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameEmpty', 'case end', 'versionName input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1042
     * @tc.name      testAppVersionNameBlank
     * @tc.desc      Checks that the a blank version name is reported with APP_VERSION_NAME_EMPTY by the
     * @tc.desc      versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '   ';
      TestLog.text('testAppVersionNameBlank', 'case begin', 'versionName input blank');
      TestLog.step('testAppVersionNameBlank', 'versionName input blank');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameBlank', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testAppVersionNameBlank', 'has code APP_VERSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameBlank', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameBlank', 'case end', 'versionName input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1043
     * @tc.name      testAppVersionNameTooLong
     * @tc.desc      Checks that the a version name longer than the maximum length is reported with
     * @tc.desc      APP_VERSION_NAME_TOO_LONG by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = `${NameUtils.repeat('1', 62)}.0.0`;
      TestLog.text('testAppVersionNameTooLong', 'case begin', 'versionName input toolong');
      TestLog.step('testAppVersionNameTooLong', 'versionName input toolong');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameTooLong', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_TOO_LONG');
      TestLog.flag('testAppVersionNameTooLong', 'has code APP_VERSION_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameTooLong', 'case end', 'versionName input toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1044
     * @tc.name      testAppVersionNameTwoSegments
     * @tc.desc      Checks that the a two segment version is reported with APP_VERSION_NAME_NOT_SEMVER by
     * @tc.desc      the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1.0';
      TestLog.text('testAppVersionNameTwoSegments', 'case begin', 'versionName input twosegments');
      TestLog.step('testAppVersionNameTwoSegments', 'versionName input twosegments');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameTwoSegments', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNameTwoSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameTwoSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameTwoSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameTwoSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameTwoSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameTwoSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameTwoSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameTwoSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameTwoSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameTwoSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameTwoSegments', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameTwoSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameTwoSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameTwoSegments', 'case end', 'versionName input twosegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1045
     * @tc.name      testAppVersionNameFourSegments
     * @tc.desc      Checks that the a four segment version is reported with APP_VERSION_NAME_NOT_SEMVER by
     * @tc.desc      the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameFourSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1.0.0.0';
      TestLog.text('testAppVersionNameFourSegments', 'case begin', 'versionName input foursegments');
      TestLog.step('testAppVersionNameFourSegments', 'versionName input foursegments');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameFourSegments', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNameFourSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameFourSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameFourSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameFourSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameFourSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameFourSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameFourSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameFourSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameFourSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameFourSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameFourSegments', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameFourSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameFourSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameFourSegments', 'case end', 'versionName input foursegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1046
     * @tc.name      testAppVersionNamePrefixV
     * @tc.desc      Checks that the a version with a v prefix is reported with APP_VERSION_NAME_NOT_SEMVER
     * @tc.desc      by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNamePrefixV',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = 'v1.0.0';
      TestLog.text('testAppVersionNamePrefixV', 'case begin', 'versionName input prefixv');
      TestLog.step('testAppVersionNamePrefixV', 'versionName input prefixv');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNamePrefixV', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNamePrefixV', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNamePrefixV', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNamePrefixV', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNamePrefixV', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNamePrefixV', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNamePrefixV', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNamePrefixV', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNamePrefixV', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNamePrefixV', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNamePrefixV', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNamePrefixV', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNamePrefixV', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNamePrefixV', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNamePrefixV', 'case end', 'versionName input prefixv');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1047
     * @tc.name      testAppVersionNameLetterPatch
     * @tc.desc      Checks that the a version with a letter patch is reported with
     * @tc.desc      APP_VERSION_NAME_NOT_SEMVER by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameLetterPatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1.0.x';
      TestLog.text('testAppVersionNameLetterPatch', 'case begin', 'versionName input letterpatch');
      TestLog.step('testAppVersionNameLetterPatch', 'versionName input letterpatch');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameLetterPatch', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNameLetterPatch', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameLetterPatch', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameLetterPatch', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameLetterPatch', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameLetterPatch', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameLetterPatch', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameLetterPatch', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameLetterPatch', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameLetterPatch', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameLetterPatch', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameLetterPatch', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameLetterPatch', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameLetterPatch', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameLetterPatch', 'case end', 'versionName input letterpatch');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1048
     * @tc.name      testAppVersionNameDoubleDot
     * @tc.desc      Checks that the a version with a double dot is reported with APP_VERSION_NAME_NOT_SEMVER
     * @tc.desc      by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameDoubleDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1..0';
      TestLog.text('testAppVersionNameDoubleDot', 'case begin', 'versionName input doubledot');
      TestLog.step('testAppVersionNameDoubleDot', 'versionName input doubledot');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameDoubleDot', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNameDoubleDot', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameDoubleDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameDoubleDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameDoubleDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameDoubleDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameDoubleDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameDoubleDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameDoubleDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameDoubleDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameDoubleDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameDoubleDot', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameDoubleDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameDoubleDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameDoubleDot', 'case end', 'versionName input doubledot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1049
     * @tc.name      testAppVersionNameSuffix
     * @tc.desc      Checks that the a version with a prerelease suffix is reported with
     * @tc.desc      APP_VERSION_NAME_NOT_SEMVER by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1.0.0-beta';
      TestLog.text('testAppVersionNameSuffix', 'case begin', 'versionName input suffix');
      TestLog.step('testAppVersionNameSuffix', 'versionName input suffix');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameSuffix', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNameSuffix', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameSuffix', 'case end', 'versionName input suffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1050
     * @tc.name      testAppVersionNameNegative
     * @tc.desc      Checks that the a negative version is reported with APP_VERSION_NAME_NOT_SEMVER by the
     * @tc.desc      versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameNegative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '-1.0.0';
      TestLog.text('testAppVersionNameNegative', 'case begin', 'versionName input negative');
      TestLog.step('testAppVersionNameNegative', 'versionName input negative');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameNegative', 'versionName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppVersionNameNegative', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppVersionNameNegative', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameNegative', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameNegative', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameNegative', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameNegative', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameNegative', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameNegative', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameNegative', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppVersionNameNegative', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameNegative', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameNegative', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameNegative', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameNegative', 'case end', 'versionName input negative');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1051
     * @tc.name      testAppVersionNameLeadingSpace
     * @tc.desc      Checks that the a version with leading whitespace is accepted by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameLeadingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = ' 1.0.0';
      TestLog.text('testAppVersionNameLeadingSpace', 'case begin', 'versionName input leadingspace');
      TestLog.step('testAppVersionNameLeadingSpace', 'versionName input leadingspace');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameLeadingSpace', 'versionName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionNameLeadingSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameLeadingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameLeadingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameLeadingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameLeadingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameLeadingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameLeadingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameLeadingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameLeadingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameLeadingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameLeadingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameLeadingSpace', 'case end', 'versionName input leadingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1052
     * @tc.name      testAppVersionNameSample
     * @tc.desc      Checks that the the sample version name is accepted by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1.0.0';
      TestLog.text('testAppVersionNameSample', 'case begin', 'versionName input sample');
      TestLog.step('testAppVersionNameSample', 'versionName input sample');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameSample', 'versionName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionNameSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameSample', 'case end', 'versionName input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1053
     * @tc.name      testAppVersionNameApiVersion
     * @tc.desc      Checks that the the API version name is accepted by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameApiVersion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '26.0.0';
      TestLog.text('testAppVersionNameApiVersion', 'case begin', 'versionName input apiversion');
      TestLog.step('testAppVersionNameApiVersion', 'versionName input apiversion');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameApiVersion', 'versionName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionNameApiVersion', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameApiVersion', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameApiVersion', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameApiVersion', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameApiVersion', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameApiVersion', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameApiVersion', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameApiVersion', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameApiVersion', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameApiVersion', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameApiVersion', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameApiVersion', 'case end', 'versionName input apiversion');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1054
     * @tc.name      testAppVersionNameZeroMajor
     * @tc.desc      Checks that the a zero major version is accepted by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameZeroMajor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '0.0.1';
      TestLog.text('testAppVersionNameZeroMajor', 'case begin', 'versionName input zeromajor');
      TestLog.step('testAppVersionNameZeroMajor', 'versionName input zeromajor');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameZeroMajor', 'versionName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionNameZeroMajor', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameZeroMajor', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameZeroMajor', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameZeroMajor', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameZeroMajor', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameZeroMajor', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameZeroMajor', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameZeroMajor', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameZeroMajor', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameZeroMajor', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameZeroMajor', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameZeroMajor', 'case end', 'versionName input zeromajor');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1055
     * @tc.name      testAppVersionNameLargeSegments
     * @tc.desc      Checks that the a version with large segments is accepted by the versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameLargeSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '123.456.789';
      TestLog.text('testAppVersionNameLargeSegments', 'case begin', 'versionName input largesegments');
      TestLog.step('testAppVersionNameLargeSegments', 'versionName input largesegments');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameLargeSegments', 'versionName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionNameLargeSegments', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameLargeSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameLargeSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameLargeSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameLargeSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameLargeSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameLargeSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameLargeSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameLargeSegments', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameLargeSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameLargeSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameLargeSegments', 'case end', 'versionName input largesegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1056
     * @tc.name      testAppVersionNameLeadingZero
     * @tc.desc      Checks that the a version with a leading zero major segment is accepted by the
     * @tc.desc      versionName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppVersionNameLeadingZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '01.0.0';
      TestLog.text('testAppVersionNameLeadingZero', 'case begin', 'versionName input leadingzero');
      TestLog.step('testAppVersionNameLeadingZero', 'versionName input leadingzero');
      const findings: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.findings('testAppVersionNameLeadingZero', 'versionName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppVersionNameLeadingZero', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppVersionNameLeadingZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppVersionNameLeadingZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppVersionNameLeadingZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppVersionNameLeadingZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppVersionNameLeadingZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppVersionNameLeadingZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppVersionNameLeadingZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppVersionNameLeadingZero', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateVersionName(appConfig);
      TestLog.number('testAppVersionNameLeadingZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppVersionNameLeadingZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppVersionNameLeadingZero', 'case end', 'versionName input leadingzero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1057
     * @tc.name      testAppIconEmpty
     * @tc.desc      Checks that the an empty icon reference is reported with RESOURCE_REF_EMPTY by the app
     * @tc.desc      icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '';
      TestLog.text('testAppIconEmpty', 'case begin', 'app icon reference input empty');
      TestLog.step('testAppIconEmpty', 'app icon reference input empty');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconEmpty', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAppIconEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconEmpty', 'case end', 'app icon reference input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1058
     * @tc.name      testAppIconNoDollar
     * @tc.desc      Checks that the an icon reference without a dollar sign is reported with
     * @tc.desc      RESOURCE_REF_NO_DOLLAR by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconNoDollar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = 'media:layered_image';
      TestLog.text('testAppIconNoDollar', 'case begin', 'app icon reference input nodollar');
      TestLog.step('testAppIconNoDollar', 'app icon reference input nodollar');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconNoDollar', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAppIconNoDollar', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconNoDollar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconNoDollar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconNoDollar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconNoDollar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconNoDollar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconNoDollar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconNoDollar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconNoDollar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconNoDollar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconNoDollar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconNoDollar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconNoDollar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconNoDollar', 'case end', 'app icon reference input nodollar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1059
     * @tc.name      testAppIconNoSeparator
     * @tc.desc      Checks that the an icon reference without a kind separator is reported with
     * @tc.desc      RESOURCE_REF_NO_SEPARATOR by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconNoSeparator',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$media';
      TestLog.text('testAppIconNoSeparator', 'case begin', 'app icon reference input noseparator');
      TestLog.step('testAppIconNoSeparator', 'app icon reference input noseparator');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconNoSeparator', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_SEPARATOR');
      TestLog.flag('testAppIconNoSeparator', 'has code RESOURCE_REF_NO_SEPARATOR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconNoSeparator', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconNoSeparator', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconNoSeparator', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconNoSeparator', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconNoSeparator', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconNoSeparator', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconNoSeparator', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconNoSeparator', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconNoSeparator', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconNoSeparator', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconNoSeparator', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconNoSeparator', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconNoSeparator', 'case end', 'app icon reference input noseparator');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1060
     * @tc.name      testAppIconUnknownKind
     * @tc.desc      Checks that the an icon reference with an unknown kind is reported with
     * @tc.desc      RESOURCE_REF_UNKNOWN_KIND by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconUnknownKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$image:layered_image';
      TestLog.text('testAppIconUnknownKind', 'case begin', 'app icon reference input unknownkind');
      TestLog.step('testAppIconUnknownKind', 'app icon reference input unknownkind');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconUnknownKind', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_UNKNOWN_KIND');
      TestLog.flag('testAppIconUnknownKind', 'has code RESOURCE_REF_UNKNOWN_KIND', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconUnknownKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconUnknownKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconUnknownKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconUnknownKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconUnknownKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconUnknownKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconUnknownKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconUnknownKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconUnknownKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconUnknownKind', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconUnknownKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconUnknownKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconUnknownKind', 'case end', 'app icon reference input unknownkind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1061
     * @tc.name      testAppIconEmptyName
     * @tc.desc      Checks that the an icon reference with an empty name is reported with
     * @tc.desc      RESOURCE_REF_EMPTY_NAME by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$media:';
      TestLog.text('testAppIconEmptyName', 'case begin', 'app icon reference input emptyname');
      TestLog.step('testAppIconEmptyName', 'app icon reference input emptyname');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconEmptyName', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAppIconEmptyName', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconEmptyName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconEmptyName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconEmptyName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconEmptyName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconEmptyName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconEmptyName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconEmptyName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconEmptyName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconEmptyName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconEmptyName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconEmptyName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconEmptyName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconEmptyName', 'case end', 'app icon reference input emptyname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1062
     * @tc.name      testAppIconLeadingDigit
     * @tc.desc      Checks that the an icon reference starting with a digit is reported with
     * @tc.desc      RESOURCE_REF_LEADING_DIGIT by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$media:1image';
      TestLog.text('testAppIconLeadingDigit', 'case begin', 'app icon reference input leadingdigit');
      TestLog.step('testAppIconLeadingDigit', 'app icon reference input leadingdigit');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconLeadingDigit', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testAppIconLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconLeadingDigit', 'case end', 'app icon reference input leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1063
     * @tc.name      testAppIconHyphenName
     * @tc.desc      Checks that the an icon reference with a hyphen is reported with
     * @tc.desc      RESOURCE_REF_ILLEGAL_NAME by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconHyphenName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$media:layered-image';
      TestLog.text('testAppIconHyphenName', 'case begin', 'app icon reference input hyphenname');
      TestLog.step('testAppIconHyphenName', 'app icon reference input hyphenname');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconHyphenName', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testAppIconHyphenName', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconHyphenName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconHyphenName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconHyphenName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconHyphenName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconHyphenName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconHyphenName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconHyphenName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconHyphenName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconHyphenName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconHyphenName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconHyphenName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconHyphenName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconHyphenName', 'case end', 'app icon reference input hyphenname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1064
     * @tc.name      testAppIconKindMismatch
     * @tc.desc      Checks that the an icon reference using the string kind is reported with
     * @tc.desc      RESOURCE_REF_KIND_MISMATCH by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconKindMismatch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$string:layered_image';
      TestLog.text('testAppIconKindMismatch', 'case begin', 'app icon reference input kindmismatch');
      TestLog.step('testAppIconKindMismatch', 'app icon reference input kindmismatch');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconKindMismatch', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAppIconKindMismatch', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconKindMismatch', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconKindMismatch', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconKindMismatch', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconKindMismatch', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconKindMismatch', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconKindMismatch', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconKindMismatch', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconKindMismatch', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconKindMismatch', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconKindMismatch', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconKindMismatch', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconKindMismatch', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconKindMismatch', 'case end', 'app icon reference input kindmismatch');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1065
     * @tc.name      testAppIconWhitespace
     * @tc.desc      Checks that the an icon reference with surrounding whitespace is reported with
     * @tc.desc      RESOURCE_REF_WHITESPACE by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = ' $media:layered_image ';
      TestLog.text('testAppIconWhitespace', 'case begin', 'app icon reference input whitespace');
      TestLog.step('testAppIconWhitespace', 'app icon reference input whitespace');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconWhitespace', 'app icon reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_WHITESPACE');
      TestLog.flag('testAppIconWhitespace', 'has code RESOURCE_REF_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppIconWhitespace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppIconWhitespace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconWhitespace', 'case end', 'app icon reference input whitespace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1066
     * @tc.name      testAppIconSample
     * @tc.desc      Checks that the the sample icon reference is accepted by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$media:layered_image';
      TestLog.text('testAppIconSample', 'case begin', 'app icon reference input sample');
      TestLog.step('testAppIconSample', 'app icon reference input sample');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconSample', 'app icon reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppIconSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconSample', 'case end', 'app icon reference input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1067
     * @tc.name      testAppIconIconMedia
     * @tc.desc      Checks that the a simple media reference is accepted by the app icon reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppIconIconMedia',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$media:icon';
      TestLog.text('testAppIconIconMedia', 'case begin', 'app icon reference input iconmedia');
      TestLog.step('testAppIconIconMedia', 'app icon reference input iconmedia');
      const findings: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.findings('testAppIconIconMedia', 'app icon reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppIconIconMedia', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppIconIconMedia', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppIconIconMedia', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppIconIconMedia', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppIconIconMedia', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppIconIconMedia', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppIconIconMedia', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppIconIconMedia', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppIconIconMedia', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateIcon(appConfig);
      TestLog.number('testAppIconIconMedia', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppIconIconMedia', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppIconIconMedia', 'case end', 'app icon reference input iconmedia');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1068
     * @tc.name      testAppLabelEmpty
     * @tc.desc      Checks that the an empty label reference is reported with RESOURCE_REF_EMPTY by the app
     * @tc.desc      label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '';
      TestLog.text('testAppLabelEmpty', 'case begin', 'app label reference input empty');
      TestLog.step('testAppLabelEmpty', 'app label reference input empty');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelEmpty', 'app label reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testAppLabelEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppLabelEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppLabelEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelEmpty', 'case end', 'app label reference input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1069
     * @tc.name      testAppLabelNoDollar
     * @tc.desc      Checks that the a label reference without a dollar sign is reported with
     * @tc.desc      RESOURCE_REF_NO_DOLLAR by the app label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelNoDollar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = 'string:app_name';
      TestLog.text('testAppLabelNoDollar', 'case begin', 'app label reference input nodollar');
      TestLog.step('testAppLabelNoDollar', 'app label reference input nodollar');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelNoDollar', 'app label reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testAppLabelNoDollar', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppLabelNoDollar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelNoDollar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelNoDollar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelNoDollar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelNoDollar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelNoDollar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelNoDollar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelNoDollar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppLabelNoDollar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelNoDollar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelNoDollar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelNoDollar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelNoDollar', 'case end', 'app label reference input nodollar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1070
     * @tc.name      testAppLabelMediaKind
     * @tc.desc      Checks that the a label reference using the media kind is reported with
     * @tc.desc      RESOURCE_REF_KIND_MISMATCH by the app label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelMediaKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$media:app_name';
      TestLog.text('testAppLabelMediaKind', 'case begin', 'app label reference input mediakind');
      TestLog.step('testAppLabelMediaKind', 'app label reference input mediakind');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelMediaKind', 'app label reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAppLabelMediaKind', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppLabelMediaKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelMediaKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelMediaKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelMediaKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelMediaKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelMediaKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelMediaKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelMediaKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppLabelMediaKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelMediaKind', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelMediaKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelMediaKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelMediaKind', 'case end', 'app label reference input mediakind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1071
     * @tc.name      testAppLabelUnknownKind
     * @tc.desc      Checks that the a label reference with an unknown kind is reported with
     * @tc.desc      RESOURCE_REF_UNKNOWN_KIND by the app label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelUnknownKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$text:app_name';
      TestLog.text('testAppLabelUnknownKind', 'case begin', 'app label reference input unknownkind');
      TestLog.step('testAppLabelUnknownKind', 'app label reference input unknownkind');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelUnknownKind', 'app label reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_UNKNOWN_KIND');
      TestLog.flag('testAppLabelUnknownKind', 'has code RESOURCE_REF_UNKNOWN_KIND', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppLabelUnknownKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelUnknownKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelUnknownKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelUnknownKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelUnknownKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelUnknownKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelUnknownKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelUnknownKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppLabelUnknownKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelUnknownKind', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelUnknownKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelUnknownKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelUnknownKind', 'case end', 'app label reference input unknownkind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1072
     * @tc.name      testAppLabelEmptyName
     * @tc.desc      Checks that the a label reference with an empty name is reported with
     * @tc.desc      RESOURCE_REF_EMPTY_NAME by the app label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$string:';
      TestLog.text('testAppLabelEmptyName', 'case begin', 'app label reference input emptyname');
      TestLog.step('testAppLabelEmptyName', 'app label reference input emptyname');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelEmptyName', 'app label reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testAppLabelEmptyName', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppLabelEmptyName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelEmptyName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelEmptyName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelEmptyName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelEmptyName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelEmptyName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelEmptyName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelEmptyName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppLabelEmptyName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelEmptyName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelEmptyName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelEmptyName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelEmptyName', 'case end', 'app label reference input emptyname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1073
     * @tc.name      testAppLabelIllegalName
     * @tc.desc      Checks that the a label reference with a hyphen is reported with
     * @tc.desc      RESOURCE_REF_ILLEGAL_NAME by the app label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelIllegalName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$string:app-name';
      TestLog.text('testAppLabelIllegalName', 'case begin', 'app label reference input illegalname');
      TestLog.step('testAppLabelIllegalName', 'app label reference input illegalname');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelIllegalName', 'app label reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testAppLabelIllegalName', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppLabelIllegalName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelIllegalName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelIllegalName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelIllegalName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelIllegalName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelIllegalName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelIllegalName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelIllegalName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppLabelIllegalName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelIllegalName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelIllegalName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelIllegalName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelIllegalName', 'case end', 'app label reference input illegalname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1074
     * @tc.name      testAppLabelSample
     * @tc.desc      Checks that the the sample label reference is accepted by the app label reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$string:app_name';
      TestLog.text('testAppLabelSample', 'case begin', 'app label reference input sample');
      TestLog.step('testAppLabelSample', 'app label reference input sample');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelSample', 'app label reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppLabelSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelSample', 'case end', 'app label reference input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1075
     * @tc.name      testAppLabelLongName
     * @tc.desc      Checks that the a label reference with a long name is accepted by the app label
     * @tc.desc      reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppLabelLongName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$string:application_display_name';
      TestLog.text('testAppLabelLongName', 'case begin', 'app label reference input longname');
      TestLog.step('testAppLabelLongName', 'app label reference input longname');
      const findings: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.findings('testAppLabelLongName', 'app label reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppLabelLongName', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppLabelLongName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppLabelLongName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppLabelLongName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppLabelLongName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppLabelLongName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppLabelLongName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppLabelLongName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppLabelLongName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validateLabel(appConfig);
      TestLog.number('testAppLabelLongName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppLabelLongName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppLabelLongName', 'case end', 'app label reference input longname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1100
     * @tc.name      testAppFullValidationSampleValid
     * @tc.desc      Checks that the sample application configuration passes full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationSampleValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      TestLog.text('testAppFullValidationSampleValid', 'case begin', 'full app validation samplevalid');
      TestLog.step('testAppFullValidationSampleValid', 'full app validation samplevalid');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationSampleValid', 'app findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppFullValidationSampleValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationSampleValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppFullValidationSampleValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppFullValidationSampleValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppFullValidationSampleValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppFullValidationSampleValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppFullValidationSampleValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppFullValidationSampleValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppFullValidationSampleValid', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.number('testAppFullValidationSampleValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppFullValidationSampleValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppFullValidationSampleValid', 'case end', 'full app validation samplevalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1101
     * @tc.name      testAppFullValidationEmptyBundleName
     * @tc.desc      Checks that an empty bundle name is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationEmptyBundleName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.bundleName = '';
      TestLog.text('testAppFullValidationEmptyBundleName', 'case begin', 'full app validation emptybundlename');
      TestLog.step('testAppFullValidationEmptyBundleName', 'full app validation emptybundlename');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationEmptyBundleName', 'app findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppFullValidationEmptyBundleName', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppFullValidationEmptyBundleName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationEmptyBundleName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppFullValidationEmptyBundleName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppFullValidationEmptyBundleName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppFullValidationEmptyBundleName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppFullValidationEmptyBundleName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppFullValidationEmptyBundleName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppFullValidationEmptyBundleName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppFullValidationEmptyBundleName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppFullValidationEmptyBundleName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.number('testAppFullValidationEmptyBundleName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppFullValidationEmptyBundleName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppFullValidationEmptyBundleName', 'case end', 'full app validation emptybundlename');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1102
     * @tc.name      testAppFullValidationInvalidVersionName
     * @tc.desc      Checks that an invalid version name is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationInvalidVersionName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionName = '1.0';
      TestLog.text('testAppFullValidationInvalidVersionName', 'case begin', 'full app validation invalidversionname');
      TestLog.step('testAppFullValidationInvalidVersionName', 'full app validation invalidversionname');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationInvalidVersionName', 'app findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testAppFullValidationInvalidVersionName', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppFullValidationInvalidVersionName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationInvalidVersionName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppFullValidationInvalidVersionName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppFullValidationInvalidVersionName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppFullValidationInvalidVersionName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppFullValidationInvalidVersionName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppFullValidationInvalidVersionName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppFullValidationInvalidVersionName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppFullValidationInvalidVersionName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppFullValidationInvalidVersionName', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.number('testAppFullValidationInvalidVersionName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppFullValidationInvalidVersionName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppFullValidationInvalidVersionName', 'case end', 'full app validation invalidversionname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1103
     * @tc.name      testAppFullValidationInvalidVersionCode
     * @tc.desc      Checks that a non positive version code is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationInvalidVersionCode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.versionCode = 0;
      TestLog.text('testAppFullValidationInvalidVersionCode', 'case begin', 'full app validation invalidversioncode');
      TestLog.step('testAppFullValidationInvalidVersionCode', 'full app validation invalidversioncode');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationInvalidVersionCode', 'app findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testAppFullValidationInvalidVersionCode', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppFullValidationInvalidVersionCode', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationInvalidVersionCode', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppFullValidationInvalidVersionCode', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppFullValidationInvalidVersionCode', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppFullValidationInvalidVersionCode', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppFullValidationInvalidVersionCode', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppFullValidationInvalidVersionCode', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppFullValidationInvalidVersionCode', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppFullValidationInvalidVersionCode', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppFullValidationInvalidVersionCode', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.number('testAppFullValidationInvalidVersionCode', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppFullValidationInvalidVersionCode', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppFullValidationInvalidVersionCode', 'case end', 'full app validation invalidversioncode');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1104
     * @tc.name      testAppFullValidationInvalidIcon
     * @tc.desc      Checks that an icon with the wrong resource kind is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationInvalidIcon',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.icon = '$string:app_icon';
      TestLog.text('testAppFullValidationInvalidIcon', 'case begin', 'full app validation invalidicon');
      TestLog.step('testAppFullValidationInvalidIcon', 'full app validation invalidicon');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationInvalidIcon', 'app findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAppFullValidationInvalidIcon', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppFullValidationInvalidIcon', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationInvalidIcon', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppFullValidationInvalidIcon', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppFullValidationInvalidIcon', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppFullValidationInvalidIcon', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppFullValidationInvalidIcon', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppFullValidationInvalidIcon', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppFullValidationInvalidIcon', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppFullValidationInvalidIcon', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppFullValidationInvalidIcon', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.number('testAppFullValidationInvalidIcon', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppFullValidationInvalidIcon', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppFullValidationInvalidIcon', 'case end', 'full app validation invalidicon');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1105
     * @tc.name      testAppFullValidationEmptyVendor
     * @tc.desc      Checks that an empty vendor is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationEmptyVendor',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.vendor = '';
      TestLog.text('testAppFullValidationEmptyVendor', 'case begin', 'full app validation emptyvendor');
      TestLog.step('testAppFullValidationEmptyVendor', 'full app validation emptyvendor');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationEmptyVendor', 'app findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppFullValidationEmptyVendor', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppFullValidationEmptyVendor', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationEmptyVendor', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppFullValidationEmptyVendor', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppFullValidationEmptyVendor', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppFullValidationEmptyVendor', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppFullValidationEmptyVendor', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppFullValidationEmptyVendor', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppFullValidationEmptyVendor', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppFullValidationEmptyVendor', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppFullValidationEmptyVendor', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.number('testAppFullValidationEmptyVendor', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppFullValidationEmptyVendor', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppFullValidationEmptyVendor', 'case end', 'full app validation emptyvendor');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1106
     * @tc.name      testAppFullValidationInvalidLabel
     * @tc.desc      Checks that a label with the wrong resource kind is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppFullValidationInvalidLabel',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const appConfig: AppConfig = ConfigFactory.appConfig();
      appConfig.label = '$media:app_name';
      TestLog.text('testAppFullValidationInvalidLabel', 'case begin', 'full app validation invalidlabel');
      TestLog.step('testAppFullValidationInvalidLabel', 'full app validation invalidlabel');
      const findings: Finding[] = AppConfigValidator.validate(appConfig);
      TestLog.findings('testAppFullValidationInvalidLabel', 'app findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testAppFullValidationInvalidLabel', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppFullValidationInvalidLabel', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppFullValidationInvalidLabel', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {