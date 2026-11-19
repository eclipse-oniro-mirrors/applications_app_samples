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
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function AppConfigMatrixTest(): void {
  describe('AppConfigMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4800
     * @tc.name      testAppMatrixSampleSample
     * @tc.desc      Checks that the bundle name variant Sample with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = 'example';
      TestLog.text('testAppMatrixSampleSample', 'case begin', 'bundle name sample with vendor sample');
      TestLog.step('testAppMatrixSampleSample', 'bundle name sample with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSampleSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleSample', 'case end', 'bundle name sample with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4801
     * @tc.name      testAppMatrixSampleHuawei
     * @tc.desc      Checks that the bundle name variant Sample with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixSampleHuawei', 'case begin', 'bundle name sample with vendor huawei');
      TestLog.step('testAppMatrixSampleHuawei', 'bundle name sample with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleHuawei', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSampleHuawei', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleHuawei', 'case end', 'bundle name sample with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4802
     * @tc.name      testAppMatrixSampleDigitSuffix
     * @tc.desc      Checks that the bundle name variant Sample with vendor DigitSuffix is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixSampleDigitSuffix', 'case begin', 'bundle name sample with vendor digitsuffix');
      TestLog.step('testAppMatrixSampleDigitSuffix', 'bundle name sample with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleDigitSuffix', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSampleDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleDigitSuffix', 'case end', 'bundle name sample with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4803
     * @tc.name      testAppMatrixSampleEmpty
     * @tc.desc      Checks that the bundle name variant Sample with vendor Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = '';
      TestLog.text('testAppMatrixSampleEmpty', 'case begin', 'bundle name sample with vendor empty');
      TestLog.step('testAppMatrixSampleEmpty', 'bundle name sample with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixSampleEmpty', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSampleEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSampleEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleEmpty', 'case end', 'bundle name sample with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4804
     * @tc.name      testAppMatrixSampleSpaces
     * @tc.desc      Checks that the bundle name variant Sample with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = '   ';
      TestLog.text('testAppMatrixSampleSpaces', 'case begin', 'bundle name sample with vendor spaces');
      TestLog.step('testAppMatrixSampleSpaces', 'bundle name sample with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixSampleSpaces', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSampleSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSampleSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleSpaces', 'case end', 'bundle name sample with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4805
     * @tc.name      testAppMatrixSampleIllegalChar
     * @tc.desc      Checks that the bundle name variant Sample with vendor IllegalChar is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixSampleIllegalChar', 'case begin', 'bundle name sample with vendor illegalchar');
      TestLog.step('testAppMatrixSampleIllegalChar', 'bundle name sample with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixSampleIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSampleIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSampleIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleIllegalChar', 'case end', 'bundle name sample with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4806
     * @tc.name      testAppMatrixSampleSpace
     * @tc.desc      Checks that the bundle name variant Sample with vendor Space is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixSampleSpace', 'case begin', 'bundle name sample with vendor space');
      TestLog.step('testAppMatrixSampleSpace', 'bundle name sample with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleSpace', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSampleSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }