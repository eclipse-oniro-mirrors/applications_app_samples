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