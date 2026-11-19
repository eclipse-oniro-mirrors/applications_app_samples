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
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleSpace', 'case end', 'bundle name sample with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4807
     * @tc.name      testAppMatrixSampleHyphen
     * @tc.desc      Checks that the bundle name variant Sample with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixSampleHyphen', 'case begin', 'bundle name sample with vendor hyphen');
      TestLog.step('testAppMatrixSampleHyphen', 'bundle name sample with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleHyphen', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSampleHyphen', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleHyphen', 'case end', 'bundle name sample with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4808
     * @tc.name      testAppMatrixSampleTooLong
     * @tc.desc      Checks that the bundle name variant Sample with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSampleTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixSampleTooLong', 'case begin', 'bundle name sample with vendor toolong');
      TestLog.step('testAppMatrixSampleTooLong', 'bundle name sample with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSampleTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixSampleTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSampleTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSampleTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSampleTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSampleTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSampleTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSampleTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSampleTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSampleTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSampleTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSampleTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSampleTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSampleTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSampleTooLong', 'case end', 'bundle name sample with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4809
     * @tc.name      testAppMatrixDigitSuffixSample
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = 'example';
      TestLog.text('testAppMatrixDigitSuffixSample', 'case begin', 'bundle name digitsuffix with vendor sample');
      TestLog.step('testAppMatrixDigitSuffixSample', 'bundle name digitsuffix with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixDigitSuffixSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixSample', 'case end', 'bundle name digitsuffix with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4810
     * @tc.name      testAppMatrixDigitSuffixHuawei
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixDigitSuffixHuawei', 'case begin', 'bundle name digitsuffix with vendor huawei');
      TestLog.step('testAppMatrixDigitSuffixHuawei', 'bundle name digitsuffix with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixHuawei', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixDigitSuffixHuawei', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixHuawei', 'case end', 'bundle name digitsuffix with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4811
     * @tc.name      testAppMatrixDigitSuffixDigitSuffix
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor DigitSuffix is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 
        'case begin', 'bundle name digitsuffix with vendor digitsuffix');
      TestLog.step('testAppMatrixDigitSuffixDigitSuffix', 'bundle name digitsuffix with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixDigitSuffix', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixDigitSuffixDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixDigitSuffix', 
        'case end', 'bundle name digitsuffix with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4812
     * @tc.name      testAppMatrixDigitSuffixEmpty
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = '';
      TestLog.text('testAppMatrixDigitSuffixEmpty', 'case begin', 'bundle name digitsuffix with vendor empty');
      TestLog.step('testAppMatrixDigitSuffixEmpty', 'bundle name digitsuffix with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixDigitSuffixEmpty', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSuffixEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSuffixEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixEmpty', 'case end', 'bundle name digitsuffix with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4813
     * @tc.name      testAppMatrixDigitSuffixSpaces
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = '   ';
      TestLog.text('testAppMatrixDigitSuffixSpaces', 'case begin', 'bundle name digitsuffix with vendor spaces');
      TestLog.step('testAppMatrixDigitSuffixSpaces', 'bundle name digitsuffix with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixDigitSuffixSpaces', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSuffixSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSuffixSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixSpaces', 'case end', 'bundle name digitsuffix with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4814
     * @tc.name      testAppMatrixDigitSuffixIllegalChar
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor IllegalChar is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixDigitSuffixIllegalChar', 
        'case begin', 'bundle name digitsuffix with vendor illegalchar');
      TestLog.step('testAppMatrixDigitSuffixIllegalChar', 'bundle name digitsuffix with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixDigitSuffixIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSuffixIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSuffixIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixIllegalChar', 
        'case end', 'bundle name digitsuffix with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4815
     * @tc.name      testAppMatrixDigitSuffixSpace
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixDigitSuffixSpace', 'case begin', 'bundle name digitsuffix with vendor space');
      TestLog.step('testAppMatrixDigitSuffixSpace', 'bundle name digitsuffix with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixSpace', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixDigitSuffixSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixSpace', 'case end', 'bundle name digitsuffix with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4816
     * @tc.name      testAppMatrixDigitSuffixHyphen
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixDigitSuffixHyphen', 'case begin', 'bundle name digitsuffix with vendor hyphen');
      TestLog.step('testAppMatrixDigitSuffixHyphen', 'bundle name digitsuffix with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixHyphen', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixDigitSuffixHyphen', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixHyphen', 'case end', 'bundle name digitsuffix with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4817
     * @tc.name      testAppMatrixDigitSuffixTooLong
     * @tc.desc      Checks that the bundle name variant DigitSuffix with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSuffixTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.myapplication2';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixDigitSuffixTooLong', 'case begin', 'bundle name digitsuffix with vendor toolong');
      TestLog.step('testAppMatrixDigitSuffixTooLong', 'bundle name digitsuffix with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSuffixTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixDigitSuffixTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSuffixTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSuffixTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSuffixTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSuffixTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSuffixTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSuffixTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSuffixTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSuffixTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSuffixTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSuffixTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSuffixTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSuffixTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSuffixTooLong', 'case end', 'bundle name digitsuffix with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4818
     * @tc.name      testAppMatrixComExampleSample
     * @tc.desc      Checks that the bundle name variant ComExample with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = 'example';
      TestLog.text('testAppMatrixComExampleSample', 'case begin', 'bundle name comexample with vendor sample');
      TestLog.step('testAppMatrixComExampleSample', 'bundle name comexample with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixComExampleSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleSample', 'case end', 'bundle name comexample with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4819
     * @tc.name      testAppMatrixComExampleHuawei
     * @tc.desc      Checks that the bundle name variant ComExample with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixComExampleHuawei', 'case begin', 'bundle name comexample with vendor huawei');
      TestLog.step('testAppMatrixComExampleHuawei', 'bundle name comexample with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleHuawei', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixComExampleHuawei', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleHuawei', 'case end', 'bundle name comexample with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4820
     * @tc.name      testAppMatrixComExampleDigitSuffix
     * @tc.desc      Checks that the bundle name variant ComExample with vendor DigitSuffix is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixComExampleDigitSuffix', 
        'case begin', 'bundle name comexample with vendor digitsuffix');
      TestLog.step('testAppMatrixComExampleDigitSuffix', 'bundle name comexample with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleDigitSuffix', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixComExampleDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleDigitSuffix', 'case end', 'bundle name comexample with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4821
     * @tc.name      testAppMatrixComExampleEmpty
     * @tc.desc      Checks that the bundle name variant ComExample with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = '';
      TestLog.text('testAppMatrixComExampleEmpty', 'case begin', 'bundle name comexample with vendor empty');
      TestLog.step('testAppMatrixComExampleEmpty', 'bundle name comexample with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixComExampleEmpty', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixComExampleEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixComExampleEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleEmpty', 'case end', 'bundle name comexample with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4822
     * @tc.name      testAppMatrixComExampleSpaces
     * @tc.desc      Checks that the bundle name variant ComExample with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = '   ';
      TestLog.text('testAppMatrixComExampleSpaces', 'case begin', 'bundle name comexample with vendor spaces');
      TestLog.step('testAppMatrixComExampleSpaces', 'bundle name comexample with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixComExampleSpaces', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixComExampleSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixComExampleSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleSpaces', 'case end', 'bundle name comexample with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4823
     * @tc.name      testAppMatrixComExampleIllegalChar
     * @tc.desc      Checks that the bundle name variant ComExample with vendor IllegalChar is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixComExampleIllegalChar', 
        'case begin', 'bundle name comexample with vendor illegalchar');
      TestLog.step('testAppMatrixComExampleIllegalChar', 'bundle name comexample with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixComExampleIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixComExampleIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixComExampleIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleIllegalChar', 'case end', 'bundle name comexample with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4824
     * @tc.name      testAppMatrixComExampleSpace
     * @tc.desc      Checks that the bundle name variant ComExample with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixComExampleSpace', 'case begin', 'bundle name comexample with vendor space');
      TestLog.step('testAppMatrixComExampleSpace', 'bundle name comexample with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleSpace', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixComExampleSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleSpace', 'case end', 'bundle name comexample with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4825
     * @tc.name      testAppMatrixComExampleHyphen
     * @tc.desc      Checks that the bundle name variant ComExample with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixComExampleHyphen', 'case begin', 'bundle name comexample with vendor hyphen');
      TestLog.step('testAppMatrixComExampleHyphen', 'bundle name comexample with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleHyphen', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixComExampleHyphen', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleHyphen', 'case end', 'bundle name comexample with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4826
     * @tc.name      testAppMatrixComExampleTooLong
     * @tc.desc      Checks that the bundle name variant ComExample with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixComExampleTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.moduleapp';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixComExampleTooLong', 'case begin', 'bundle name comexample with vendor toolong');
      TestLog.step('testAppMatrixComExampleTooLong', 'bundle name comexample with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixComExampleTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixComExampleTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixComExampleTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixComExampleTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixComExampleTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixComExampleTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixComExampleTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixComExampleTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixComExampleTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixComExampleTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixComExampleTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixComExampleTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixComExampleTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixComExampleTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixComExampleTooLong', 'case end', 'bundle name comexample with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4827
     * @tc.name      testAppMatrixSnakeSample
     * @tc.desc      Checks that the bundle name variant Snake with vendor Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = 'example';
      TestLog.text('testAppMatrixSnakeSample', 'case begin', 'bundle name snake with vendor sample');
      TestLog.step('testAppMatrixSnakeSample', 'bundle name snake with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSnakeSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeSample', 'case end', 'bundle name snake with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4828
     * @tc.name      testAppMatrixSnakeHuawei
     * @tc.desc      Checks that the bundle name variant Snake with vendor Huawei is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixSnakeHuawei', 'case begin', 'bundle name snake with vendor huawei');
      TestLog.step('testAppMatrixSnakeHuawei', 'bundle name snake with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeHuawei', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSnakeHuawei', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeHuawei', 'case end', 'bundle name snake with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4829
     * @tc.name      testAppMatrixSnakeDigitSuffix
     * @tc.desc      Checks that the bundle name variant Snake with vendor DigitSuffix is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixSnakeDigitSuffix', 'case begin', 'bundle name snake with vendor digitsuffix');
      TestLog.step('testAppMatrixSnakeDigitSuffix', 'bundle name snake with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeDigitSuffix', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSnakeDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeDigitSuffix', 'case end', 'bundle name snake with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4830
     * @tc.name      testAppMatrixSnakeEmpty
     * @tc.desc      Checks that the bundle name variant Snake with vendor Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = '';
      TestLog.text('testAppMatrixSnakeEmpty', 'case begin', 'bundle name snake with vendor empty');
      TestLog.step('testAppMatrixSnakeEmpty', 'bundle name snake with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixSnakeEmpty', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSnakeEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSnakeEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeEmpty', 'case end', 'bundle name snake with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4831
     * @tc.name      testAppMatrixSnakeSpaces
     * @tc.desc      Checks that the bundle name variant Snake with vendor Spaces is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = '   ';
      TestLog.text('testAppMatrixSnakeSpaces', 'case begin', 'bundle name snake with vendor spaces');
      TestLog.step('testAppMatrixSnakeSpaces', 'bundle name snake with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixSnakeSpaces', 'has code APP_VENDOR_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSnakeSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSnakeSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeSpaces', 'case end', 'bundle name snake with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4832
     * @tc.name      testAppMatrixSnakeIllegalChar
     * @tc.desc      Checks that the bundle name variant Snake with vendor IllegalChar is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixSnakeIllegalChar', 'case begin', 'bundle name snake with vendor illegalchar');
      TestLog.step('testAppMatrixSnakeIllegalChar', 'bundle name snake with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixSnakeIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSnakeIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSnakeIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeIllegalChar', 'case end', 'bundle name snake with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4833
     * @tc.name      testAppMatrixSnakeSpace
     * @tc.desc      Checks that the bundle name variant Snake with vendor Space is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixSnakeSpace', 'case begin', 'bundle name snake with vendor space');
      TestLog.step('testAppMatrixSnakeSpace', 'bundle name snake with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeSpace', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSnakeSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeSpace', 'case end', 'bundle name snake with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4834
     * @tc.name      testAppMatrixSnakeHyphen
     * @tc.desc      Checks that the bundle name variant Snake with vendor Hyphen is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixSnakeHyphen', 'case begin', 'bundle name snake with vendor hyphen');
      TestLog.step('testAppMatrixSnakeHyphen', 'bundle name snake with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeHyphen', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testAppMatrixSnakeHyphen', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeHyphen', 'case end', 'bundle name snake with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4835
     * @tc.name      testAppMatrixSnakeTooLong
     * @tc.desc      Checks that the bundle name variant Snake with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixSnakeTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my_app';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixSnakeTooLong', 'case begin', 'bundle name snake with vendor toolong');
      TestLog.step('testAppMatrixSnakeTooLong', 'bundle name snake with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixSnakeTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixSnakeTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixSnakeTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixSnakeTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixSnakeTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixSnakeTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixSnakeTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixSnakeTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixSnakeTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixSnakeTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixSnakeTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixSnakeTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixSnakeTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixSnakeTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixSnakeTooLong', 'case end', 'bundle name snake with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4836
     * @tc.name      testAppMatrixEmptySample
     * @tc.desc      Checks that the bundle name variant Empty with vendor Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = 'example';
      TestLog.text('testAppMatrixEmptySample', 'case begin', 'bundle name empty with vendor sample');
      TestLog.step('testAppMatrixEmptySample', 'bundle name empty with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptySample', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySample', 'case end', 'bundle name empty with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4837
     * @tc.name      testAppMatrixEmptyHuawei
     * @tc.desc      Checks that the bundle name variant Empty with vendor Huawei is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptyHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixEmptyHuawei', 'case begin', 'bundle name empty with vendor huawei');
      TestLog.step('testAppMatrixEmptyHuawei', 'bundle name empty with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptyHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptyHuawei', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptyHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptyHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptyHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptyHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptyHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptyHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptyHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptyHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptyHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptyHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptyHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptyHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptyHuawei', 'case end', 'bundle name empty with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4838
     * @tc.name      testAppMatrixEmptyDigitSuffix
     * @tc.desc      Checks that the bundle name variant Empty with vendor DigitSuffix is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST