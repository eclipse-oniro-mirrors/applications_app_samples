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