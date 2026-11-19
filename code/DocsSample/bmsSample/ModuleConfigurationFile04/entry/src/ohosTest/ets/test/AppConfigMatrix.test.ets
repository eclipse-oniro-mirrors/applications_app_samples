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
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptyDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixEmptyDigitSuffix', 'case begin', 'bundle name empty with vendor digitsuffix');
      TestLog.step('testAppMatrixEmptyDigitSuffix', 'bundle name empty with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptyDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptyDigitSuffix', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptyDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptyDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptyDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptyDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptyDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptyDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptyDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptyDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptyDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptyDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptyDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptyDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptyDigitSuffix', 'case end', 'bundle name empty with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4839
     * @tc.name      testAppMatrixEmptyEmpty
     * @tc.desc      Checks that the bundle name variant Empty with vendor Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptyEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = '';
      TestLog.text('testAppMatrixEmptyEmpty', 'case begin', 'bundle name empty with vendor empty');
      TestLog.step('testAppMatrixEmptyEmpty', 'bundle name empty with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptyEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptyEmpty', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixEmptyEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptyEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptyEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptyEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptyEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptyEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptyEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptyEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptyEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptyEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptyEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptyEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptyEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptyEmpty', 'case end', 'bundle name empty with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4840
     * @tc.name      testAppMatrixEmptySpaces
     * @tc.desc      Checks that the bundle name variant Empty with vendor Spaces is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = '   ';
      TestLog.text('testAppMatrixEmptySpaces', 'case begin', 'bundle name empty with vendor spaces');
      TestLog.step('testAppMatrixEmptySpaces', 'bundle name empty with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptySpaces', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixEmptySpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySpaces', 'case end', 'bundle name empty with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4841
     * @tc.name      testAppMatrixEmptyIllegalChar
     * @tc.desc      Checks that the bundle name variant Empty with vendor IllegalChar is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptyIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixEmptyIllegalChar', 'case begin', 'bundle name empty with vendor illegalchar');
      TestLog.step('testAppMatrixEmptyIllegalChar', 'bundle name empty with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptyIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptyIllegalChar', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixEmptyIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptyIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptyIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptyIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptyIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptyIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptyIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptyIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptyIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptyIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptyIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptyIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptyIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptyIllegalChar', 'case end', 'bundle name empty with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4842
     * @tc.name      testAppMatrixEmptySpace
     * @tc.desc      Checks that the bundle name variant Empty with vendor Space is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixEmptySpace', 'case begin', 'bundle name empty with vendor space');
      TestLog.step('testAppMatrixEmptySpace', 'bundle name empty with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptySpace', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySpace', 'case end', 'bundle name empty with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4843
     * @tc.name      testAppMatrixEmptyHyphen
     * @tc.desc      Checks that the bundle name variant Empty with vendor Hyphen is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptyHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixEmptyHyphen', 'case begin', 'bundle name empty with vendor hyphen');
      TestLog.step('testAppMatrixEmptyHyphen', 'bundle name empty with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptyHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptyHyphen', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptyHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptyHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptyHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptyHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptyHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptyHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptyHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptyHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptyHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptyHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptyHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptyHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptyHyphen', 'case end', 'bundle name empty with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4844
     * @tc.name      testAppMatrixEmptyTooLong
     * @tc.desc      Checks that the bundle name variant Empty with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptyTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = '';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixEmptyTooLong', 'case begin', 'bundle name empty with vendor toolong');
      TestLog.step('testAppMatrixEmptyTooLong', 'bundle name empty with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptyTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY');
      TestLog.flag('testAppMatrixEmptyTooLong', 'has code APP_BUNDLE_NAME_EMPTY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixEmptyTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptyTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptyTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptyTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptyTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptyTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptyTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptyTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptyTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptyTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptyTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptyTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptyTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptyTooLong', 'case end', 'bundle name empty with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4845
     * @tc.name      testAppMatrixUpperSample
     * @tc.desc      Checks that the bundle name variant Upper with vendor Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = 'example';
      TestLog.text('testAppMatrixUpperSample', 'case begin', 'bundle name upper with vendor sample');
      TestLog.step('testAppMatrixUpperSample', 'bundle name upper with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperSample', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperSample', 'case end', 'bundle name upper with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4846
     * @tc.name      testAppMatrixUpperHuawei
     * @tc.desc      Checks that the bundle name variant Upper with vendor Huawei is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixUpperHuawei', 'case begin', 'bundle name upper with vendor huawei');
      TestLog.step('testAppMatrixUpperHuawei', 'bundle name upper with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperHuawei', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperHuawei', 'case end', 'bundle name upper with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4847
     * @tc.name      testAppMatrixUpperDigitSuffix
     * @tc.desc      Checks that the bundle name variant Upper with vendor DigitSuffix is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixUpperDigitSuffix', 'case begin', 'bundle name upper with vendor digitsuffix');
      TestLog.step('testAppMatrixUpperDigitSuffix', 'bundle name upper with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperDigitSuffix', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperDigitSuffix', 'case end', 'bundle name upper with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4848
     * @tc.name      testAppMatrixUpperEmpty
     * @tc.desc      Checks that the bundle name variant Upper with vendor Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = '';
      TestLog.text('testAppMatrixUpperEmpty', 'case begin', 'bundle name upper with vendor empty');
      TestLog.step('testAppMatrixUpperEmpty', 'bundle name upper with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperEmpty', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixUpperEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperEmpty', 'case end', 'bundle name upper with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4849
     * @tc.name      testAppMatrixUpperSpaces
     * @tc.desc      Checks that the bundle name variant Upper with vendor Spaces is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = '   ';
      TestLog.text('testAppMatrixUpperSpaces', 'case begin', 'bundle name upper with vendor spaces');
      TestLog.step('testAppMatrixUpperSpaces', 'bundle name upper with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperSpaces', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixUpperSpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperSpaces', 'case end', 'bundle name upper with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4850
     * @tc.name      testAppMatrixUpperIllegalChar
     * @tc.desc      Checks that the bundle name variant Upper with vendor IllegalChar is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixUpperIllegalChar', 'case begin', 'bundle name upper with vendor illegalchar');
      TestLog.step('testAppMatrixUpperIllegalChar', 'bundle name upper with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperIllegalChar', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixUpperIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperIllegalChar', 'case end', 'bundle name upper with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4851
     * @tc.name      testAppMatrixUpperSpace
     * @tc.desc      Checks that the bundle name variant Upper with vendor Space is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixUpperSpace', 'case begin', 'bundle name upper with vendor space');
      TestLog.step('testAppMatrixUpperSpace', 'bundle name upper with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperSpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperSpace', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperSpace', 'case end', 'bundle name upper with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4852
     * @tc.name      testAppMatrixUpperHyphen
     * @tc.desc      Checks that the bundle name variant Upper with vendor Hyphen is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixUpperHyphen', 'case begin', 'bundle name upper with vendor hyphen');
      TestLog.step('testAppMatrixUpperHyphen', 'bundle name upper with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperHyphen', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperHyphen', 'case end', 'bundle name upper with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4853
     * @tc.name      testAppMatrixUpperTooLong
     * @tc.desc      Checks that the bundle name variant Upper with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixUpperTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'Ohos.app.hap.myapplication';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixUpperTooLong', 'case begin', 'bundle name upper with vendor toolong');
      TestLog.step('testAppMatrixUpperTooLong', 'bundle name upper with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixUpperTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_UPPERCASE');
      TestLog.flag('testAppMatrixUpperTooLong', 'has code APP_BUNDLE_NAME_UPPERCASE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixUpperTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixUpperTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixUpperTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixUpperTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixUpperTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixUpperTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixUpperTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixUpperTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixUpperTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixUpperTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixUpperTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixUpperTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixUpperTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixUpperTooLong', 'case end', 'bundle name upper with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4854
     * @tc.name      testAppMatrixWhitespaceSample
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = 'example';
      TestLog.text('testAppMatrixWhitespaceSample', 'case begin', 'bundle name whitespace with vendor sample');
      TestLog.step('testAppMatrixWhitespaceSample', 'bundle name whitespace with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceSample', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceSample', 'case end', 'bundle name whitespace with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4855
     * @tc.name      testAppMatrixWhitespaceHuawei
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixWhitespaceHuawei', 'case begin', 'bundle name whitespace with vendor huawei');
      TestLog.step('testAppMatrixWhitespaceHuawei', 'bundle name whitespace with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceHuawei', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceHuawei', 'case end', 'bundle name whitespace with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4856
     * @tc.name      testAppMatrixWhitespaceDigitSuffix
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor DigitSuffix is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixWhitespaceDigitSuffix', 
        'case begin', 'bundle name whitespace with vendor digitsuffix');
      TestLog.step('testAppMatrixWhitespaceDigitSuffix', 'bundle name whitespace with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceDigitSuffix', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceDigitSuffix', 'case end', 'bundle name whitespace with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4857
     * @tc.name      testAppMatrixWhitespaceEmpty
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = '';
      TestLog.text('testAppMatrixWhitespaceEmpty', 'case begin', 'bundle name whitespace with vendor empty');
      TestLog.step('testAppMatrixWhitespaceEmpty', 'bundle name whitespace with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceEmpty', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixWhitespaceEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceEmpty', 'case end', 'bundle name whitespace with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4858
     * @tc.name      testAppMatrixWhitespaceSpaces
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = '   ';
      TestLog.text('testAppMatrixWhitespaceSpaces', 'case begin', 'bundle name whitespace with vendor spaces');
      TestLog.step('testAppMatrixWhitespaceSpaces', 'bundle name whitespace with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceSpaces', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixWhitespaceSpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceSpaces', 'case end', 'bundle name whitespace with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4859
     * @tc.name      testAppMatrixWhitespaceIllegalChar
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor IllegalChar is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixWhitespaceIllegalChar', 
        'case begin', 'bundle name whitespace with vendor illegalchar');
      TestLog.step('testAppMatrixWhitespaceIllegalChar', 'bundle name whitespace with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceIllegalChar', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixWhitespaceIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceIllegalChar', 'case end', 'bundle name whitespace with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4860
     * @tc.name      testAppMatrixWhitespaceSpace
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixWhitespaceSpace', 'case begin', 'bundle name whitespace with vendor space');
      TestLog.step('testAppMatrixWhitespaceSpace', 'bundle name whitespace with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceSpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceSpace', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceSpace', 'case end', 'bundle name whitespace with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4861
     * @tc.name      testAppMatrixWhitespaceHyphen
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixWhitespaceHyphen', 'case begin', 'bundle name whitespace with vendor hyphen');
      TestLog.step('testAppMatrixWhitespaceHyphen', 'bundle name whitespace with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceHyphen', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceHyphen', 'case end', 'bundle name whitespace with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4862
     * @tc.name      testAppMatrixWhitespaceTooLong
     * @tc.desc      Checks that the bundle name variant Whitespace with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixWhitespaceTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos app.hap.myapplication';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixWhitespaceTooLong', 'case begin', 'bundle name whitespace with vendor toolong');
      TestLog.step('testAppMatrixWhitespaceTooLong', 'bundle name whitespace with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixWhitespaceTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_WHITESPACE');
      TestLog.flag('testAppMatrixWhitespaceTooLong', 'has code APP_BUNDLE_NAME_WHITESPACE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixWhitespaceTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixWhitespaceTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixWhitespaceTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixWhitespaceTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixWhitespaceTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixWhitespaceTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixWhitespaceTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixWhitespaceTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixWhitespaceTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixWhitespaceTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixWhitespaceTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixWhitespaceTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixWhitespaceTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixWhitespaceTooLong', 'case end', 'bundle name whitespace with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4863
     * @tc.name      testAppMatrixEmptySegmentSample
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = 'example';
      TestLog.text('testAppMatrixEmptySegmentSample', 'case begin', 'bundle name emptysegment with vendor sample');
      TestLog.step('testAppMatrixEmptySegmentSample', 'bundle name emptysegment with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentSample', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentSample', 'case end', 'bundle name emptysegment with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4864
     * @tc.name      testAppMatrixEmptySegmentHuawei
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixEmptySegmentHuawei', 'case begin', 'bundle name emptysegment with vendor huawei');
      TestLog.step('testAppMatrixEmptySegmentHuawei', 'bundle name emptysegment with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentHuawei', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentHuawei', 'case end', 'bundle name emptysegment with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4865
     * @tc.name      testAppMatrixEmptySegmentDigitSuffix
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor DigitSuffix is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 
        'case begin', 'bundle name emptysegment with vendor digitsuffix');
      TestLog.step('testAppMatrixEmptySegmentDigitSuffix', 'bundle name emptysegment with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentDigitSuffix', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentDigitSuffix', 
        'case end', 'bundle name emptysegment with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4866
     * @tc.name      testAppMatrixEmptySegmentEmpty
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = '';
      TestLog.text('testAppMatrixEmptySegmentEmpty', 'case begin', 'bundle name emptysegment with vendor empty');
      TestLog.step('testAppMatrixEmptySegmentEmpty', 'bundle name emptysegment with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentEmpty', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixEmptySegmentEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentEmpty', 'case end', 'bundle name emptysegment with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4867
     * @tc.name      testAppMatrixEmptySegmentSpaces
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = '   ';
      TestLog.text('testAppMatrixEmptySegmentSpaces', 'case begin', 'bundle name emptysegment with vendor spaces');
      TestLog.step('testAppMatrixEmptySegmentSpaces', 'bundle name emptysegment with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentSpaces', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixEmptySegmentSpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentSpaces', 'case end', 'bundle name emptysegment with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4868
     * @tc.name      testAppMatrixEmptySegmentIllegalChar
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor IllegalChar is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixEmptySegmentIllegalChar', 
        'case begin', 'bundle name emptysegment with vendor illegalchar');
      TestLog.step('testAppMatrixEmptySegmentIllegalChar', 'bundle name emptysegment with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentIllegalChar', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixEmptySegmentIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentIllegalChar', 
        'case end', 'bundle name emptysegment with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4869
     * @tc.name      testAppMatrixEmptySegmentSpace
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixEmptySegmentSpace', 'case begin', 'bundle name emptysegment with vendor space');
      TestLog.step('testAppMatrixEmptySegmentSpace', 'bundle name emptysegment with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentSpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentSpace', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentSpace', 'case end', 'bundle name emptysegment with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4870
     * @tc.name      testAppMatrixEmptySegmentHyphen
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixEmptySegmentHyphen', 'case begin', 'bundle name emptysegment with vendor hyphen');
      TestLog.step('testAppMatrixEmptySegmentHyphen', 'bundle name emptysegment with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentHyphen', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentHyphen', 'case end', 'bundle name emptysegment with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4871
     * @tc.name      testAppMatrixEmptySegmentTooLong
     * @tc.desc      Checks that the bundle name variant EmptySegment with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixEmptySegmentTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos..hap.myapplication';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixEmptySegmentTooLong', 'case begin', 'bundle name emptysegment with vendor toolong');
      TestLog.step('testAppMatrixEmptySegmentTooLong', 'bundle name emptysegment with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixEmptySegmentTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_EMPTY_SEGMENT');
      TestLog.flag('testAppMatrixEmptySegmentTooLong', 'has code APP_BUNDLE_NAME_EMPTY_SEGMENT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixEmptySegmentTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixEmptySegmentTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixEmptySegmentTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixEmptySegmentTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixEmptySegmentTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixEmptySegmentTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixEmptySegmentTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixEmptySegmentTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixEmptySegmentTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixEmptySegmentTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixEmptySegmentTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixEmptySegmentTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixEmptySegmentTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixEmptySegmentTooLong', 'case end', 'bundle name emptysegment with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4872
     * @tc.name      testAppMatrixTooFewSegmentsSample
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = 'example';
      TestLog.text('testAppMatrixTooFewSegmentsSample', 'case begin', 'bundle name toofewsegments with vendor sample');
      TestLog.step('testAppMatrixTooFewSegmentsSample', 'bundle name toofewsegments with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsSample', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsSample', 'case end', 'bundle name toofewsegments with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4873
     * @tc.name      testAppMatrixTooFewSegmentsHuawei
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'case begin', 'bundle name toofewsegments with vendor huawei');
      TestLog.step('testAppMatrixTooFewSegmentsHuawei', 'bundle name toofewsegments with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsHuawei', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsHuawei', 'case end', 'bundle name toofewsegments with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4874
     * @tc.name      testAppMatrixTooFewSegmentsDigitSuffix
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor DigitSuffix is reported
     * @tc.desc      by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 
        'case begin', 'bundle name toofewsegments with vendor digitsuffix');
      TestLog.step('testAppMatrixTooFewSegmentsDigitSuffix', 'bundle name toofewsegments with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsDigitSuffix', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsDigitSuffix', 
        'case end', 'bundle name toofewsegments with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4875
     * @tc.name      testAppMatrixTooFewSegmentsEmpty
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = '';
      TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'case begin', 'bundle name toofewsegments with vendor empty');
      TestLog.step('testAppMatrixTooFewSegmentsEmpty', 'bundle name toofewsegments with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsEmpty', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixTooFewSegmentsEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsEmpty', 'case end', 'bundle name toofewsegments with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4876
     * @tc.name      testAppMatrixTooFewSegmentsSpaces
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = '   ';
      TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'case begin', 'bundle name toofewsegments with vendor spaces');
      TestLog.step('testAppMatrixTooFewSegmentsSpaces', 'bundle name toofewsegments with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsSpaces', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixTooFewSegmentsSpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsSpaces', 'case end', 'bundle name toofewsegments with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4877
     * @tc.name      testAppMatrixTooFewSegmentsIllegalChar
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor IllegalChar is reported
     * @tc.desc      by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 
        'case begin', 'bundle name toofewsegments with vendor illegalchar');
      TestLog.step('testAppMatrixTooFewSegmentsIllegalChar', 'bundle name toofewsegments with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsIllegalChar', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixTooFewSegmentsIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsIllegalChar', 
        'case end', 'bundle name toofewsegments with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4878
     * @tc.name      testAppMatrixTooFewSegmentsSpace
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixTooFewSegmentsSpace', 'case begin', 'bundle name toofewsegments with vendor space');
      TestLog.step('testAppMatrixTooFewSegmentsSpace', 'bundle name toofewsegments with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsSpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsSpace', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsSpace', 'case end', 'bundle name toofewsegments with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4879
     * @tc.name      testAppMatrixTooFewSegmentsHyphen
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'case begin', 'bundle name toofewsegments with vendor hyphen');
      TestLog.step('testAppMatrixTooFewSegmentsHyphen', 'bundle name toofewsegments with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsHyphen', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsHyphen', 'case end', 'bundle name toofewsegments with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4880
     * @tc.name      testAppMatrixTooFewSegmentsTooLong
     * @tc.desc      Checks that the bundle name variant TooFewSegments with vendor TooLong is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixTooFewSegmentsTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixTooFewSegmentsTooLong', 
        'case begin', 'bundle name toofewsegments with vendor toolong');
      TestLog.step('testAppMatrixTooFewSegmentsTooLong', 'bundle name toofewsegments with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixTooFewSegmentsTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_TOO_FEW_SEGMENTS');
      TestLog.flag('testAppMatrixTooFewSegmentsTooLong', 'has code APP_BUNDLE_NAME_TOO_FEW_SEGMENTS', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixTooFewSegmentsTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixTooFewSegmentsTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixTooFewSegmentsTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixTooFewSegmentsTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixTooFewSegmentsTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixTooFewSegmentsTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixTooFewSegmentsTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixTooFewSegmentsTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixTooFewSegmentsTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixTooFewSegmentsTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixTooFewSegmentsTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixTooFewSegmentsTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixTooFewSegmentsTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixTooFewSegmentsTooLong', 'case end', 'bundle name toofewsegments with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4881
     * @tc.name      testAppMatrixIllegalCharSample
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = 'example';
      TestLog.text('testAppMatrixIllegalCharSample', 'case begin', 'bundle name illegalchar with vendor sample');
      TestLog.step('testAppMatrixIllegalCharSample', 'bundle name illegalchar with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharSample', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharSample', 'case end', 'bundle name illegalchar with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4882
     * @tc.name      testAppMatrixIllegalCharHuawei
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixIllegalCharHuawei', 'case begin', 'bundle name illegalchar with vendor huawei');
      TestLog.step('testAppMatrixIllegalCharHuawei', 'bundle name illegalchar with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharHuawei', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharHuawei', 'case end', 'bundle name illegalchar with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4883
     * @tc.name      testAppMatrixIllegalCharDigitSuffix
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor DigitSuffix is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixIllegalCharDigitSuffix', 
        'case begin', 'bundle name illegalchar with vendor digitsuffix');
      TestLog.step('testAppMatrixIllegalCharDigitSuffix', 'bundle name illegalchar with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharDigitSuffix', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharDigitSuffix', 
        'case end', 'bundle name illegalchar with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4884
     * @tc.name      testAppMatrixIllegalCharEmpty
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = '';
      TestLog.text('testAppMatrixIllegalCharEmpty', 'case begin', 'bundle name illegalchar with vendor empty');
      TestLog.step('testAppMatrixIllegalCharEmpty', 'bundle name illegalchar with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharEmpty', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixIllegalCharEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharEmpty', 'case end', 'bundle name illegalchar with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4885
     * @tc.name      testAppMatrixIllegalCharSpaces
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = '   ';
      TestLog.text('testAppMatrixIllegalCharSpaces', 'case begin', 'bundle name illegalchar with vendor spaces');
      TestLog.step('testAppMatrixIllegalCharSpaces', 'bundle name illegalchar with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharSpaces', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixIllegalCharSpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharSpaces', 'case end', 'bundle name illegalchar with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4886
     * @tc.name      testAppMatrixIllegalCharIllegalChar
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor IllegalChar is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixIllegalCharIllegalChar', 
        'case begin', 'bundle name illegalchar with vendor illegalchar');
      TestLog.step('testAppMatrixIllegalCharIllegalChar', 'bundle name illegalchar with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharIllegalChar', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharIllegalChar', 
        'case end', 'bundle name illegalchar with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4887
     * @tc.name      testAppMatrixIllegalCharSpace
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixIllegalCharSpace', 'case begin', 'bundle name illegalchar with vendor space');
      TestLog.step('testAppMatrixIllegalCharSpace', 'bundle name illegalchar with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharSpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharSpace', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharSpace', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharSpace', 'case end', 'bundle name illegalchar with vendor space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4888
     * @tc.name      testAppMatrixIllegalCharHyphen
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor Hyphen is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = 'ex-ample';
      TestLog.text('testAppMatrixIllegalCharHyphen', 'case begin', 'bundle name illegalchar with vendor hyphen');
      TestLog.step('testAppMatrixIllegalCharHyphen', 'bundle name illegalchar with vendor hyphen');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharHyphen', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharHyphen', 'case end', 'bundle name illegalchar with vendor hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4889
     * @tc.name      testAppMatrixIllegalCharTooLong
     * @tc.desc      Checks that the bundle name variant IllegalChar with vendor TooLong is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixIllegalCharTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'com.example.my-application';
      config.vendor = ('a'.repeat(65));
      TestLog.text('testAppMatrixIllegalCharTooLong', 'case begin', 'bundle name illegalchar with vendor toolong');
      TestLog.step('testAppMatrixIllegalCharTooLong', 'bundle name illegalchar with vendor toolong');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixIllegalCharTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixIllegalCharTooLong', 'has code APP_BUNDLE_NAME_ILLEGAL_CHAR', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_TOO_LONG');
      TestLog.flag('testAppMatrixIllegalCharTooLong', 'has code APP_VENDOR_TOO_LONG', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixIllegalCharTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixIllegalCharTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixIllegalCharTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixIllegalCharTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixIllegalCharTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixIllegalCharTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixIllegalCharTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixIllegalCharTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixIllegalCharTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixIllegalCharTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixIllegalCharTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixIllegalCharTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixIllegalCharTooLong', 'case end', 'bundle name illegalchar with vendor toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4890
     * @tc.name      testAppMatrixDigitSegmentSample
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor Sample is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = 'example';
      TestLog.text('testAppMatrixDigitSegmentSample', 'case begin', 'bundle name digitsegment with vendor sample');
      TestLog.step('testAppMatrixDigitSegmentSample', 'bundle name digitsegment with vendor sample');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentSample', 'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSegmentSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSegmentSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSegmentSample', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSegmentSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSegmentSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSegmentSample', 'case end', 'bundle name digitsegment with vendor sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4891
     * @tc.name      testAppMatrixDigitSegmentHuawei
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor Huawei is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentHuawei',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = 'huawei';
      TestLog.text('testAppMatrixDigitSegmentHuawei', 'case begin', 'bundle name digitsegment with vendor huawei');
      TestLog.step('testAppMatrixDigitSegmentHuawei', 'bundle name digitsegment with vendor huawei');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentHuawei', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentHuawei', 'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentHuawei', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentHuawei', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentHuawei', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentHuawei', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentHuawei', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentHuawei', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentHuawei', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSegmentHuawei', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSegmentHuawei', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSegmentHuawei', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSegmentHuawei', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSegmentHuawei', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSegmentHuawei', 'case end', 'bundle name digitsegment with vendor huawei');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4892
     * @tc.name      testAppMatrixDigitSegmentDigitSuffix
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor DigitSuffix is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = 'example_2';
      TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 
        'case begin', 'bundle name digitsegment with vendor digitsuffix');
      TestLog.step('testAppMatrixDigitSegmentDigitSuffix', 'bundle name digitsegment with vendor digitsuffix');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentDigitSuffix',
        'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSegmentDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSegmentDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSegmentDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSegmentDigitSuffix', 
        'case end', 'bundle name digitsegment with vendor digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4893
     * @tc.name      testAppMatrixDigitSegmentEmpty
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor Empty is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = '';
      TestLog.text('testAppMatrixDigitSegmentEmpty', 'case begin', 'bundle name digitsegment with vendor empty');
      TestLog.step('testAppMatrixDigitSegmentEmpty', 'bundle name digitsegment with vendor empty');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentEmpty', 'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixDigitSegmentEmpty', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSegmentEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSegmentEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSegmentEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSegmentEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSegmentEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSegmentEmpty', 'case end', 'bundle name digitsegment with vendor empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4894
     * @tc.name      testAppMatrixDigitSegmentSpaces
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor Spaces is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = '   ';
      TestLog.text('testAppMatrixDigitSegmentSpaces', 'case begin', 'bundle name digitsegment with vendor spaces');
      TestLog.step('testAppMatrixDigitSegmentSpaces', 'bundle name digitsegment with vendor spaces');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentSpaces', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentSpaces', 'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_EMPTY');
      TestLog.flag('testAppMatrixDigitSegmentSpaces', 'has code APP_VENDOR_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSegmentSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSegmentSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSegmentSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSegmentSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSegmentSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSegmentSpaces', 'case end', 'bundle name digitsegment with vendor spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4895
     * @tc.name      testAppMatrixDigitSegmentIllegalChar
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor IllegalChar is reported by
     * @tc.desc      the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentIllegalChar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = 'ex!ample';
      TestLog.text('testAppMatrixDigitSegmentIllegalChar', 
        'case begin', 'bundle name digitsegment with vendor illegalchar');
      TestLog.step('testAppMatrixDigitSegmentIllegalChar', 'bundle name digitsegment with vendor illegalchar');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentIllegalChar', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentIllegalChar',
        'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VENDOR_ILLEGAL_CHAR');
      TestLog.flag('testAppMatrixDigitSegmentIllegalChar', 'has code APP_VENDOR_ILLEGAL_CHAR', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentIllegalChar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentIllegalChar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentIllegalChar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentIllegalChar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentIllegalChar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentIllegalChar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentIllegalChar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testAppMatrixDigitSegmentIllegalChar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testAppMatrixDigitSegmentIllegalChar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testAppMatrixDigitSegmentIllegalChar', 'first signature', firstSignature);
      const repeat: Finding[] = AppConfigValidator.validate(config);
      TestLog.number('testAppMatrixDigitSegmentIllegalChar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testAppMatrixDigitSegmentIllegalChar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testAppMatrixDigitSegmentIllegalChar', 
        'case end', 'bundle name digitsegment with vendor illegalchar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4896
     * @tc.name      testAppMatrixDigitSegmentSpace
     * @tc.desc      Checks that the bundle name variant DigitSegment with vendor Space is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testAppMatrixDigitSegmentSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.bundleName = 'ohos.1app.hap.myapplication';
      config.vendor = 'ex ample';
      TestLog.text('testAppMatrixDigitSegmentSpace', 'case begin', 'bundle name digitsegment with vendor space');
      TestLog.step('testAppMatrixDigitSegmentSpace', 'bundle name digitsegment with vendor space');
      const findings: Finding[] = AppConfigValidator.validate(config);
      TestLog.findings('testAppMatrixDigitSegmentSpace', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT');
      TestLog.flag('testAppMatrixDigitSegmentSpace', 'has code APP_BUNDLE_NAME_SEGMENT_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testAppMatrixDigitSegmentSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testAppMatrixDigitSegmentSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testAppMatrixDigitSegmentSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testAppMatrixDigitSegmentSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testAppMatrixDigitSegmentSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testAppMatrixDigitSegmentSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testAppMatrixDigitSegmentSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();