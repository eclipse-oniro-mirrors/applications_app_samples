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
export default function VersionMatrixTest(): void {
  describe('VersionMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5500
     * @tc.name      testVersionMatrixSampleSample
     * @tc.desc      Checks that version code Sample with version name Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSampleSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = '1.0.0';
      TestLog.text('testVersionMatrixSampleSample', 'case begin', 'version code sample with name sample');
      TestLog.step('testVersionMatrixSampleSample', 'version code sample with name sample');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSampleSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixSampleSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSampleSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSampleSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSampleSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSampleSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSampleSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSampleSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSampleSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSampleSample', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSampleSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSampleSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSampleSample', 'case end', 'version code sample with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5501
     * @tc.name      testVersionMatrixSampleZero
     * @tc.desc      Checks that version code Sample with version name Zero is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSampleZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = '0.0.0';
      TestLog.text('testVersionMatrixSampleZero', 'case begin', 'version code sample with name zero');
      TestLog.step('testVersionMatrixSampleZero', 'version code sample with name zero');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSampleZero', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixSampleZero', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSampleZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSampleZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSampleZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSampleZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSampleZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSampleZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSampleZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSampleZero', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSampleZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSampleZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSampleZero', 'case end', 'version code sample with name zero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5502
     * @tc.name      testVersionMatrixSampleLarge
     * @tc.desc      Checks that version code Sample with version name Large is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSampleLarge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = '12.34.5678';
      TestLog.text('testVersionMatrixSampleLarge', 'case begin', 'version code sample with name large');
      TestLog.step('testVersionMatrixSampleLarge', 'version code sample with name large');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSampleLarge', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixSampleLarge', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSampleLarge', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSampleLarge', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSampleLarge', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSampleLarge', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSampleLarge', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSampleLarge', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSampleLarge', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSampleLarge', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSampleLarge', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSampleLarge', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSampleLarge', 'case end', 'version code sample with name large');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5503
     * @tc.name      testVersionMatrixSampleEmpty
     * @tc.desc      Checks that version code Sample with version name Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSampleEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = '';
      TestLog.text('testVersionMatrixSampleEmpty', 'case begin', 'version code sample with name empty');
      TestLog.step('testVersionMatrixSampleEmpty', 'version code sample with name empty');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSampleEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testVersionMatrixSampleEmpty', 'has code APP_VERSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixSampleEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSampleEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSampleEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSampleEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSampleEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSampleEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSampleEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSampleEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixSampleEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSampleEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSampleEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSampleEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSampleEmpty', 'case end', 'version code sample with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5504
     * @tc.name      testVersionMatrixSampleTwoSegments
     * @tc.desc      Checks that version code Sample with version name TwoSegments is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSampleTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = '1.0';
      TestLog.text('testVersionMatrixSampleTwoSegments', 'case begin', 'version code sample with name twosegments');
      TestLog.step('testVersionMatrixSampleTwoSegments', 'version code sample with name twosegments');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSampleTwoSegments', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixSampleTwoSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixSampleTwoSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSampleTwoSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSampleTwoSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSampleTwoSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSampleTwoSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSampleTwoSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSampleTwoSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSampleTwoSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixSampleTwoSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSampleTwoSegments', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSampleTwoSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSampleTwoSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSampleTwoSegments', 'case end', 'version code sample with name twosegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5505
     * @tc.name      testVersionMatrixSamplePrefix
     * @tc.desc      Checks that version code Sample with version name Prefix is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSamplePrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = 'v1.0.0';
      TestLog.text('testVersionMatrixSamplePrefix', 'case begin', 'version code sample with name prefix');
      TestLog.step('testVersionMatrixSamplePrefix', 'version code sample with name prefix');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSamplePrefix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixSamplePrefix', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixSamplePrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSamplePrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSamplePrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSamplePrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSamplePrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSamplePrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSamplePrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSamplePrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixSamplePrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSamplePrefix', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSamplePrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSamplePrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSamplePrefix', 'case end', 'version code sample with name prefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5506
     * @tc.name      testVersionMatrixSamplePrerelease
     * @tc.desc      Checks that version code Sample with version name Prerelease is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSamplePrerelease',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = '1.0.0-beta';
      TestLog.text('testVersionMatrixSamplePrerelease', 'case begin', 'version code sample with name prerelease');
      TestLog.step('testVersionMatrixSamplePrerelease', 'version code sample with name prerelease');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSamplePrerelease', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixSamplePrerelease', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixSamplePrerelease', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSamplePrerelease', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSamplePrerelease', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSamplePrerelease', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSamplePrerelease', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSamplePrerelease', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSamplePrerelease', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSamplePrerelease', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixSamplePrerelease', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSamplePrerelease', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSamplePrerelease', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSamplePrerelease', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSamplePrerelease', 'case end', 'version code sample with name prerelease');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5507
     * @tc.name      testVersionMatrixSampleTooLong
     * @tc.desc      Checks that version code Sample with version name TooLong is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixSampleTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1000000;
      config.versionName = ('a'.repeat(65));
      TestLog.text('testVersionMatrixSampleTooLong', 'case begin', 'version code sample with name toolong');
      TestLog.step('testVersionMatrixSampleTooLong', 'version code sample with name toolong');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixSampleTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_TOO_LONG');
      TestLog.flag('testVersionMatrixSampleTooLong', 'has code APP_VERSION_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixSampleTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixSampleTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixSampleTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixSampleTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixSampleTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixSampleTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixSampleTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixSampleTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixSampleTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixSampleTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixSampleTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixSampleTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixSampleTooLong', 'case end', 'version code sample with name toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5508
     * @tc.name      testVersionMatrixMinimumSample
     * @tc.desc      Checks that version code Minimum with version name Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = '1.0.0';
      TestLog.text('testVersionMatrixMinimumSample', 'case begin', 'version code minimum with name sample');
      TestLog.step('testVersionMatrixMinimumSample', 'version code minimum with name sample');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixMinimumSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumSample', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumSample', 'case end', 'version code minimum with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5509
     * @tc.name      testVersionMatrixMinimumZero
     * @tc.desc      Checks that version code Minimum with version name Zero is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = '0.0.0';
      TestLog.text('testVersionMatrixMinimumZero', 'case begin', 'version code minimum with name zero');
      TestLog.step('testVersionMatrixMinimumZero', 'version code minimum with name zero');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumZero', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixMinimumZero', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumZero', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumZero', 'case end', 'version code minimum with name zero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5510
     * @tc.name      testVersionMatrixMinimumLarge
     * @tc.desc      Checks that version code Minimum with version name Large is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumLarge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = '12.34.5678';
      TestLog.text('testVersionMatrixMinimumLarge', 'case begin', 'version code minimum with name large');
      TestLog.step('testVersionMatrixMinimumLarge', 'version code minimum with name large');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumLarge', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixMinimumLarge', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumLarge', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumLarge', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumLarge', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumLarge', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumLarge', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumLarge', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumLarge', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumLarge', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumLarge', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumLarge', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumLarge', 'case end', 'version code minimum with name large');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5511
     * @tc.name      testVersionMatrixMinimumEmpty
     * @tc.desc      Checks that version code Minimum with version name Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = '';
      TestLog.text('testVersionMatrixMinimumEmpty', 'case begin', 'version code minimum with name empty');
      TestLog.step('testVersionMatrixMinimumEmpty', 'version code minimum with name empty');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testVersionMatrixMinimumEmpty', 'has code APP_VERSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMinimumEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMinimumEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumEmpty', 'case end', 'version code minimum with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5512
     * @tc.name      testVersionMatrixMinimumTwoSegments
     * @tc.desc      Checks that version code Minimum with version name TwoSegments is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = '1.0';
      TestLog.text('testVersionMatrixMinimumTwoSegments', 'case begin', 'version code minimum with name twosegments');
      TestLog.step('testVersionMatrixMinimumTwoSegments', 'version code minimum with name twosegments');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumTwoSegments', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixMinimumTwoSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMinimumTwoSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumTwoSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumTwoSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumTwoSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumTwoSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumTwoSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumTwoSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumTwoSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMinimumTwoSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumTwoSegments', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumTwoSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumTwoSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumTwoSegments', 'case end', 'version code minimum with name twosegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5513
     * @tc.name      testVersionMatrixMinimumPrefix
     * @tc.desc      Checks that version code Minimum with version name Prefix is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = 'v1.0.0';
      TestLog.text('testVersionMatrixMinimumPrefix', 'case begin', 'version code minimum with name prefix');
      TestLog.step('testVersionMatrixMinimumPrefix', 'version code minimum with name prefix');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumPrefix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixMinimumPrefix', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMinimumPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMinimumPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumPrefix', 'case end', 'version code minimum with name prefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5514
     * @tc.name      testVersionMatrixMinimumPrerelease
     * @tc.desc      Checks that version code Minimum with version name Prerelease is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumPrerelease',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = '1.0.0-beta';
      TestLog.text('testVersionMatrixMinimumPrerelease', 'case begin', 'version code minimum with name prerelease');
      TestLog.step('testVersionMatrixMinimumPrerelease', 'version code minimum with name prerelease');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumPrerelease', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixMinimumPrerelease', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMinimumPrerelease', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumPrerelease', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumPrerelease', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumPrerelease', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumPrerelease', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumPrerelease', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumPrerelease', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumPrerelease', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMinimumPrerelease', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumPrerelease', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumPrerelease', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumPrerelease', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumPrerelease', 'case end', 'version code minimum with name prerelease');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5515
     * @tc.name      testVersionMatrixMinimumTooLong
     * @tc.desc      Checks that version code Minimum with version name TooLong is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMinimumTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 1;
      config.versionName = ('a'.repeat(65));
      TestLog.text('testVersionMatrixMinimumTooLong', 'case begin', 'version code minimum with name toolong');
      TestLog.step('testVersionMatrixMinimumTooLong', 'version code minimum with name toolong');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMinimumTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_TOO_LONG');
      TestLog.flag('testVersionMatrixMinimumTooLong', 'has code APP_VERSION_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMinimumTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMinimumTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMinimumTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMinimumTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMinimumTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMinimumTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMinimumTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMinimumTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMinimumTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMinimumTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMinimumTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMinimumTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMinimumTooLong', 'case end', 'version code minimum with name toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5516
     * @tc.name      testVersionMatrixTwoSample
     * @tc.desc      Checks that version code Two with version name Sample is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = '1.0.0';
      TestLog.text('testVersionMatrixTwoSample', 'case begin', 'version code two with name sample');
      TestLog.step('testVersionMatrixTwoSample', 'version code two with name sample');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixTwoSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoSample', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoSample', 'case end', 'version code two with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5517
     * @tc.name      testVersionMatrixTwoZero
     * @tc.desc      Checks that version code Two with version name Zero is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = '0.0.0';
      TestLog.text('testVersionMatrixTwoZero', 'case begin', 'version code two with name zero');
      TestLog.step('testVersionMatrixTwoZero', 'version code two with name zero');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoZero', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixTwoZero', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoZero', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoZero', 'case end', 'version code two with name zero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5518
     * @tc.name      testVersionMatrixTwoLarge
     * @tc.desc      Checks that version code Two with version name Large is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoLarge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = '12.34.5678';
      TestLog.text('testVersionMatrixTwoLarge', 'case begin', 'version code two with name large');
      TestLog.step('testVersionMatrixTwoLarge', 'version code two with name large');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoLarge', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixTwoLarge', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoLarge', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoLarge', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoLarge', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoLarge', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoLarge', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoLarge', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoLarge', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoLarge', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoLarge', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoLarge', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoLarge', 'case end', 'version code two with name large');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5519
     * @tc.name      testVersionMatrixTwoEmpty
     * @tc.desc      Checks that version code Two with version name Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = '';
      TestLog.text('testVersionMatrixTwoEmpty', 'case begin', 'version code two with name empty');
      TestLog.step('testVersionMatrixTwoEmpty', 'version code two with name empty');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testVersionMatrixTwoEmpty', 'has code APP_VERSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixTwoEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixTwoEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoEmpty', 'case end', 'version code two with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5520
     * @tc.name      testVersionMatrixTwoTwoSegments
     * @tc.desc      Checks that version code Two with version name TwoSegments is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = '1.0';
      TestLog.text('testVersionMatrixTwoTwoSegments', 'case begin', 'version code two with name twosegments');
      TestLog.step('testVersionMatrixTwoTwoSegments', 'version code two with name twosegments');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoTwoSegments', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixTwoTwoSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixTwoTwoSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoTwoSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoTwoSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoTwoSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoTwoSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoTwoSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoTwoSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoTwoSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixTwoTwoSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoTwoSegments', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoTwoSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoTwoSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoTwoSegments', 'case end', 'version code two with name twosegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5521
     * @tc.name      testVersionMatrixTwoPrefix
     * @tc.desc      Checks that version code Two with version name Prefix is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = 'v1.0.0';
      TestLog.text('testVersionMatrixTwoPrefix', 'case begin', 'version code two with name prefix');
      TestLog.step('testVersionMatrixTwoPrefix', 'version code two with name prefix');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoPrefix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixTwoPrefix', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixTwoPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixTwoPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoPrefix', 'case end', 'version code two with name prefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5522
     * @tc.name      testVersionMatrixTwoPrerelease
     * @tc.desc      Checks that version code Two with version name Prerelease is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoPrerelease',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = '1.0.0-beta';
      TestLog.text('testVersionMatrixTwoPrerelease', 'case begin', 'version code two with name prerelease');
      TestLog.step('testVersionMatrixTwoPrerelease', 'version code two with name prerelease');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoPrerelease', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixTwoPrerelease', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixTwoPrerelease', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoPrerelease', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoPrerelease', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoPrerelease', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoPrerelease', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoPrerelease', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoPrerelease', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoPrerelease', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixTwoPrerelease', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoPrerelease', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoPrerelease', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoPrerelease', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoPrerelease', 'case end', 'version code two with name prerelease');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5523
     * @tc.name      testVersionMatrixTwoTooLong
     * @tc.desc      Checks that version code Two with version name TooLong is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixTwoTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2;
      config.versionName = ('a'.repeat(65));
      TestLog.text('testVersionMatrixTwoTooLong', 'case begin', 'version code two with name toolong');
      TestLog.step('testVersionMatrixTwoTooLong', 'version code two with name toolong');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixTwoTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_TOO_LONG');
      TestLog.flag('testVersionMatrixTwoTooLong', 'has code APP_VERSION_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixTwoTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixTwoTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixTwoTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixTwoTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixTwoTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixTwoTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixTwoTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixTwoTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixTwoTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixTwoTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixTwoTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixTwoTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixTwoTooLong', 'case end', 'version code two with name toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5524
     * @tc.name      testVersionMatrixMaximumSample
     * @tc.desc      Checks that version code Maximum with version name Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = '1.0.0';
      TestLog.text('testVersionMatrixMaximumSample', 'case begin', 'version code maximum with name sample');
      TestLog.step('testVersionMatrixMaximumSample', 'version code maximum with name sample');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixMaximumSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumSample', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumSample', 'case end', 'version code maximum with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5525
     * @tc.name      testVersionMatrixMaximumZero
     * @tc.desc      Checks that version code Maximum with version name Zero is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = '0.0.0';
      TestLog.text('testVersionMatrixMaximumZero', 'case begin', 'version code maximum with name zero');
      TestLog.step('testVersionMatrixMaximumZero', 'version code maximum with name zero');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumZero', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixMaximumZero', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumZero', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumZero', 'case end', 'version code maximum with name zero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5526
     * @tc.name      testVersionMatrixMaximumLarge
     * @tc.desc      Checks that version code Maximum with version name Large is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumLarge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = '12.34.5678';
      TestLog.text('testVersionMatrixMaximumLarge', 'case begin', 'version code maximum with name large');
      TestLog.step('testVersionMatrixMaximumLarge', 'version code maximum with name large');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumLarge', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testVersionMatrixMaximumLarge', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumLarge', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumLarge', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumLarge', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumLarge', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumLarge', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumLarge', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumLarge', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumLarge', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumLarge', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumLarge', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumLarge', 'case end', 'version code maximum with name large');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5527
     * @tc.name      testVersionMatrixMaximumEmpty
     * @tc.desc      Checks that version code Maximum with version name Empty is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = '';
      TestLog.text('testVersionMatrixMaximumEmpty', 'case begin', 'version code maximum with name empty');
      TestLog.step('testVersionMatrixMaximumEmpty', 'version code maximum with name empty');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testVersionMatrixMaximumEmpty', 'has code APP_VERSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMaximumEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMaximumEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumEmpty', 'case end', 'version code maximum with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5528
     * @tc.name      testVersionMatrixMaximumTwoSegments
     * @tc.desc      Checks that version code Maximum with version name TwoSegments is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = '1.0';
      TestLog.text('testVersionMatrixMaximumTwoSegments', 'case begin', 'version code maximum with name twosegments');
      TestLog.step('testVersionMatrixMaximumTwoSegments', 'version code maximum with name twosegments');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumTwoSegments', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixMaximumTwoSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMaximumTwoSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumTwoSegments', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumTwoSegments', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumTwoSegments', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumTwoSegments', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumTwoSegments', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumTwoSegments', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumTwoSegments', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMaximumTwoSegments', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumTwoSegments', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumTwoSegments', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumTwoSegments', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumTwoSegments', 'case end', 'version code maximum with name twosegments');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5529
     * @tc.name      testVersionMatrixMaximumPrefix
     * @tc.desc      Checks that version code Maximum with version name Prefix is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumPrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = 'v1.0.0';
      TestLog.text('testVersionMatrixMaximumPrefix', 'case begin', 'version code maximum with name prefix');
      TestLog.step('testVersionMatrixMaximumPrefix', 'version code maximum with name prefix');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumPrefix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixMaximumPrefix', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMaximumPrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumPrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumPrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumPrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumPrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumPrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumPrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumPrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMaximumPrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumPrefix', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumPrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumPrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumPrefix', 'case end', 'version code maximum with name prefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5530
     * @tc.name      testVersionMatrixMaximumPrerelease
     * @tc.desc      Checks that version code Maximum with version name Prerelease is reported by the
     * @tc.desc      expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumPrerelease',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = '1.0.0-beta';
      TestLog.text('testVersionMatrixMaximumPrerelease', 'case begin', 'version code maximum with name prerelease');
      TestLog.step('testVersionMatrixMaximumPrerelease', 'version code maximum with name prerelease');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumPrerelease', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixMaximumPrerelease', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMaximumPrerelease', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumPrerelease', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumPrerelease', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumPrerelease', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumPrerelease', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumPrerelease', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumPrerelease', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumPrerelease', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMaximumPrerelease', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumPrerelease', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumPrerelease', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumPrerelease', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumPrerelease', 'case end', 'version code maximum with name prerelease');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5531
     * @tc.name      testVersionMatrixMaximumTooLong
     * @tc.desc      Checks that version code Maximum with version name TooLong is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixMaximumTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 2147483647;
      config.versionName = ('a'.repeat(65));
      TestLog.text('testVersionMatrixMaximumTooLong', 'case begin', 'version code maximum with name toolong');
      TestLog.step('testVersionMatrixMaximumTooLong', 'version code maximum with name toolong');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixMaximumTooLong', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_TOO_LONG');
      TestLog.flag('testVersionMatrixMaximumTooLong', 'has code APP_VERSION_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixMaximumTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixMaximumTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixMaximumTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixMaximumTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixMaximumTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixMaximumTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixMaximumTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixMaximumTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixMaximumTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixMaximumTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixMaximumTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixMaximumTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixMaximumTooLong', 'case end', 'version code maximum with name toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5532
     * @tc.name      testVersionMatrixZeroSample
     * @tc.desc      Checks that version code Zero with version name Sample is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixZeroSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 0;
      config.versionName = '1.0.0';
      TestLog.text('testVersionMatrixZeroSample', 'case begin', 'version code zero with name sample');
      TestLog.step('testVersionMatrixZeroSample', 'version code zero with name sample');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixZeroSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testVersionMatrixZeroSample', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixZeroSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixZeroSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixZeroSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixZeroSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixZeroSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixZeroSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixZeroSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixZeroSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixZeroSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixZeroSample', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixZeroSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixZeroSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixZeroSample', 'case end', 'version code zero with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5533
     * @tc.name      testVersionMatrixZeroZero
     * @tc.desc      Checks that version code Zero with version name Zero is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixZeroZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 0;
      config.versionName = '0.0.0';
      TestLog.text('testVersionMatrixZeroZero', 'case begin', 'version code zero with name zero');
      TestLog.step('testVersionMatrixZeroZero', 'version code zero with name zero');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixZeroZero', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testVersionMatrixZeroZero', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixZeroZero', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixZeroZero', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixZeroZero', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixZeroZero', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixZeroZero', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixZeroZero', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixZeroZero', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixZeroZero', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixZeroZero', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixZeroZero', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixZeroZero', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixZeroZero', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixZeroZero', 'case end', 'version code zero with name zero');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5534
     * @tc.name      testVersionMatrixZeroLarge
     * @tc.desc      Checks that version code Zero with version name Large is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixZeroLarge',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 0;
      config.versionName = '12.34.5678';
      TestLog.text('testVersionMatrixZeroLarge', 'case begin', 'version code zero with name large');
      TestLog.step('testVersionMatrixZeroLarge', 'version code zero with name large');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixZeroLarge', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testVersionMatrixZeroLarge', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixZeroLarge', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixZeroLarge', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixZeroLarge', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixZeroLarge', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixZeroLarge', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixZeroLarge', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixZeroLarge', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixZeroLarge', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixZeroLarge', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixZeroLarge', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixZeroLarge', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixZeroLarge', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixZeroLarge', 'case end', 'version code zero with name large');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5535
     * @tc.name      testVersionMatrixZeroEmpty
     * @tc.desc      Checks that version code Zero with version name Empty is reported by the expected rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixZeroEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 0;
      config.versionName = '';
      TestLog.text('testVersionMatrixZeroEmpty', 'case begin', 'version code zero with name empty');
      TestLog.step('testVersionMatrixZeroEmpty', 'version code zero with name empty');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixZeroEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testVersionMatrixZeroEmpty', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_EMPTY');
      TestLog.flag('testVersionMatrixZeroEmpty', 'has code APP_VERSION_NAME_EMPTY', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixZeroEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testVersionMatrixZeroEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testVersionMatrixZeroEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testVersionMatrixZeroEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testVersionMatrixZeroEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testVersionMatrixZeroEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testVersionMatrixZeroEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testVersionMatrixZeroEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testVersionMatrixZeroEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testVersionMatrixZeroEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.number('testVersionMatrixZeroEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testVersionMatrixZeroEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testVersionMatrixZeroEmpty', 'case end', 'version code zero with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_5536
     * @tc.name      testVersionMatrixZeroTwoSegments
     * @tc.desc      Checks that version code Zero with version name TwoSegments is reported by the expected
     * @tc.desc      rules.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVersionMatrixZeroTwoSegments',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const config: AppConfig = ConfigFactory.appConfig();
      config.versionCode = 0;
      config.versionName = '1.0';
      TestLog.text('testVersionMatrixZeroTwoSegments', 'case begin', 'version code zero with name twosegments');
      TestLog.step('testVersionMatrixZeroTwoSegments', 'version code zero with name twosegments');
      const findings: Finding[] = 
        AppConfigValidator.validateVersionCode(config).concat(AppConfigValidator.validateVersionName(config));
      TestLog.findings('testVersionMatrixZeroTwoSegments', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_CODE_NOT_POSITIVE');
      TestLog.flag('testVersionMatrixZeroTwoSegments', 'has code APP_VERSION_CODE_NOT_POSITIVE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'APP_VERSION_NAME_NOT_SEMVER');
      TestLog.flag('testVersionMatrixZeroTwoSegments', 'has code APP_VERSION_NAME_NOT_SEMVER', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testVersionMatrixZeroTwoSegments', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;