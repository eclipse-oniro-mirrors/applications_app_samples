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
import type { UriConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
export default function UriValidationTest(): void {
  describe('UriValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3200
     * @tc.name      testUriSchemeHttps
     * @tc.desc      Checks that the https value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeHttps',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'https';
      TestLog.text('testUriSchemeHttps', 'case begin', 'uri.scheme input https');
      TestLog.step('testUriSchemeHttps', 'uri.scheme input https');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeHttps', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeHttps', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeHttps', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeHttps', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeHttps', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeHttps', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeHttps', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeHttps', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeHttps', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeHttps', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeHttps', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeHttps', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeHttps', 'case end', 'uri.scheme input https');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3201
     * @tc.name      testUriSchemeHttp
     * @tc.desc      Checks that the http value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeHttp',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'http';
      TestLog.text('testUriSchemeHttp', 'case begin', 'uri.scheme input http');
      TestLog.step('testUriSchemeHttp', 'uri.scheme input http');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeHttp', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeHttp', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeHttp', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeHttp', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeHttp', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeHttp', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeHttp', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeHttp', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeHttp', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeHttp', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeHttp', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeHttp', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeHttp', 'case end', 'uri.scheme input http');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3202
     * @tc.name      testUriSchemeOhosApp
     * @tc.desc      Checks that the ohosapp value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeOhosApp',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'ohosapp';
      TestLog.text('testUriSchemeOhosApp', 'case begin', 'uri.scheme input ohosapp');
      TestLog.step('testUriSchemeOhosApp', 'uri.scheme input ohosapp');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeOhosApp', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeOhosApp', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeOhosApp', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeOhosApp', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeOhosApp', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeOhosApp', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeOhosApp', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeOhosApp', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeOhosApp', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeOhosApp', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeOhosApp', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeOhosApp', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeOhosApp', 'case end', 'uri.scheme input ohosapp');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3203
     * @tc.name      testUriSchemeSnake
     * @tc.desc      Checks that the snake value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeSnake',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'my_scheme';
      TestLog.text('testUriSchemeSnake', 'case begin', 'uri.scheme input snake');
      TestLog.step('testUriSchemeSnake', 'uri.scheme input snake');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeSnake', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeSnake', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeSnake', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeSnake', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeSnake', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeSnake', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeSnake', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeSnake', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeSnake', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeSnake', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeSnake', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeSnake', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeSnake', 'case end', 'uri.scheme input snake');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3204
     * @tc.name      testUriSchemeSingleLetter
     * @tc.desc      Checks that the singleletter value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeSingleLetter',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'a';
      TestLog.text('testUriSchemeSingleLetter', 'case begin', 'uri.scheme input singleletter');
      TestLog.step('testUriSchemeSingleLetter', 'uri.scheme input singleletter');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeSingleLetter', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeSingleLetter', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeSingleLetter', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeSingleLetter', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeSingleLetter', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeSingleLetter', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeSingleLetter', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeSingleLetter', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeSingleLetter', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeSingleLetter', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeSingleLetter', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeSingleLetter', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeSingleLetter', 'case end', 'uri.scheme input singleletter');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3205
     * @tc.name      testUriSchemeDigitSuffix
     * @tc.desc      Checks that the digitsuffix value is accepted by the uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'scheme1';
      TestLog.text('testUriSchemeDigitSuffix', 'case begin', 'uri.scheme input digitsuffix');
      TestLog.step('testUriSchemeDigitSuffix', 'uri.scheme input digitsuffix');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeDigitSuffix', 'uri.scheme', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriSchemeDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeDigitSuffix', 'case end', 'uri.scheme input digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3206
     * @tc.name      testUriSchemeEmpty
     * @tc.desc      Checks that the empty value is reported with MODULE_SKILL_URI_SCHEME_EMPTY by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = '';
      TestLog.text('testUriSchemeEmpty', 'case begin', 'uri.scheme input empty');
      TestLog.step('testUriSchemeEmpty', 'uri.scheme input empty');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeEmpty', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_EMPTY');
      TestLog.flag('testUriSchemeEmpty', 'has code MODULE_SKILL_URI_SCHEME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeEmpty', 'case end', 'uri.scheme input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3207
     * @tc.name      testUriSchemeSpaces
     * @tc.desc      Checks that the spaces value is reported with MODULE_SKILL_URI_SCHEME_EMPTY by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = '  ';
      TestLog.text('testUriSchemeSpaces', 'case begin', 'uri.scheme input spaces');
      TestLog.step('testUriSchemeSpaces', 'uri.scheme input spaces');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeSpaces', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_EMPTY');
      TestLog.flag('testUriSchemeSpaces', 'has code MODULE_SKILL_URI_SCHEME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeSpaces', 'case end', 'uri.scheme input spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3208
     * @tc.name      testUriSchemeUpper
     * @tc.desc      Checks that the upper value is reported with MODULE_SKILL_URI_SCHEME_ILLEGAL by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'HTTPS';
      TestLog.text('testUriSchemeUpper', 'case begin', 'uri.scheme input upper');
      TestLog.step('testUriSchemeUpper', 'uri.scheme input upper');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeUpper', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testUriSchemeUpper', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeUpper', 'case end', 'uri.scheme input upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3209
     * @tc.name      testUriSchemeColon
     * @tc.desc      Checks that the colon value is reported with MODULE_SKILL_URI_SCHEME_ILLEGAL by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeColon',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'https:';
      TestLog.text('testUriSchemeColon', 'case begin', 'uri.scheme input colon');
      TestLog.step('testUriSchemeColon', 'uri.scheme input colon');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeColon', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testUriSchemeColon', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeColon', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeColon', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeColon', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeColon', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeColon', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeColon', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeColon', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeColon', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeColon', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeColon', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeColon', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeColon', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeColon', 'case end', 'uri.scheme input colon');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3210
     * @tc.name      testUriSchemeHyphen
     * @tc.desc      Checks that the hyphen value is reported with MODULE_SKILL_URI_SCHEME_ILLEGAL by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'my-scheme';
      TestLog.text('testUriSchemeHyphen', 'case begin', 'uri.scheme input hyphen');
      TestLog.step('testUriSchemeHyphen', 'uri.scheme input hyphen');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeHyphen', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testUriSchemeHyphen', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeHyphen', 'case end', 'uri.scheme input hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3211
     * @tc.name      testUriSchemeDigitFirst
     * @tc.desc      Checks that the digitfirst value is reported with MODULE_SKILL_URI_SCHEME_ILLEGAL by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeDigitFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = '1https';
      TestLog.text('testUriSchemeDigitFirst', 'case begin', 'uri.scheme input digitfirst');
      TestLog.step('testUriSchemeDigitFirst', 'uri.scheme input digitfirst');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeDigitFirst', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testUriSchemeDigitFirst', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeDigitFirst', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeDigitFirst', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeDigitFirst', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeDigitFirst', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeDigitFirst', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeDigitFirst', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeDigitFirst', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeDigitFirst', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeDigitFirst', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeDigitFirst', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeDigitFirst', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeDigitFirst', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeDigitFirst', 'case end', 'uri.scheme input digitfirst');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3212
     * @tc.name      testUriSchemeSpace
     * @tc.desc      Checks that the space value is reported with MODULE_SKILL_URI_SCHEME_ILLEGAL by the
     * @tc.desc      uri.scheme rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriSchemeSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'my scheme';
      TestLog.text('testUriSchemeSpace', 'case begin', 'uri.scheme input space');
      TestLog.step('testUriSchemeSpace', 'uri.scheme input space');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriSchemeSpace', 'uri.scheme', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testUriSchemeSpace', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriSchemeSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriSchemeSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriSchemeSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriSchemeSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriSchemeSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriSchemeSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriSchemeSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriSchemeSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriSchemeSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriSchemeSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriSchemeSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriSchemeSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriSchemeSpace', 'case end', 'uri.scheme input space');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3240
     * @tc.name      testUriHostDomain
     * @tc.desc      Checks that the domain value is accepted by the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostDomain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'www.example.com';
      TestLog.text('testUriHostDomain', 'case begin', 'uri.host input domain');
      TestLog.step('testUriHostDomain', 'uri.host input domain');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostDomain', 'uri.host', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriHostDomain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostDomain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostDomain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostDomain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostDomain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostDomain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostDomain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostDomain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostDomain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostDomain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostDomain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostDomain', 'case end', 'uri.host input domain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3241
     * @tc.name      testUriHostShortDomain
     * @tc.desc      Checks that the shortdomain value is accepted by the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostShortDomain',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'example.com';
      TestLog.text('testUriHostShortDomain', 'case begin', 'uri.host input shortdomain');
      TestLog.step('testUriHostShortDomain', 'uri.host input shortdomain');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostShortDomain', 'uri.host', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriHostShortDomain', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostShortDomain', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostShortDomain', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostShortDomain', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostShortDomain', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostShortDomain', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostShortDomain', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostShortDomain', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostShortDomain', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostShortDomain', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostShortDomain', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostShortDomain', 'case end', 'uri.host input shortdomain');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3242
     * @tc.name      testUriHostLocalhost
     * @tc.desc      Checks that the localhost value is accepted by the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostLocalhost',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'localhost';
      TestLog.text('testUriHostLocalhost', 'case begin', 'uri.host input localhost');
      TestLog.step('testUriHostLocalhost', 'uri.host input localhost');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostLocalhost', 'uri.host', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriHostLocalhost', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostLocalhost', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostLocalhost', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostLocalhost', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostLocalhost', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostLocalhost', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostLocalhost', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostLocalhost', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostLocalhost', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostLocalhost', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostLocalhost', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostLocalhost', 'case end', 'uri.host input localhost');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3243
     * @tc.name      testUriHostWithPort
     * @tc.desc      Checks that the withport value is accepted by the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostWithPort',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'www.example.com:8080';
      TestLog.text('testUriHostWithPort', 'case begin', 'uri.host input withport');
      TestLog.step('testUriHostWithPort', 'uri.host input withport');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostWithPort', 'uri.host', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriHostWithPort', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostWithPort', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostWithPort', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostWithPort', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostWithPort', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostWithPort', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostWithPort', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostWithPort', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostWithPort', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostWithPort', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostWithPort', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostWithPort', 'case end', 'uri.host input withport');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3244
     * @tc.name      testUriHostIpv4
     * @tc.desc      Checks that the ipv4 value is accepted by the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostIpv4',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = '127.0.0.1';
      TestLog.text('testUriHostIpv4', 'case begin', 'uri.host input ipv4');
      TestLog.step('testUriHostIpv4', 'uri.host input ipv4');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostIpv4', 'uri.host', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriHostIpv4', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostIpv4', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostIpv4', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostIpv4', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostIpv4', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostIpv4', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostIpv4', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostIpv4', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostIpv4', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostIpv4', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostIpv4', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostIpv4', 'case end', 'uri.host input ipv4');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3245
     * @tc.name      testUriHostEmpty
     * @tc.desc      Checks that the empty value is accepted by the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = '';
      TestLog.text('testUriHostEmpty', 'case begin', 'uri.host input empty');
      TestLog.step('testUriHostEmpty', 'uri.host input empty');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostEmpty', 'uri.host', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriHostEmpty', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostEmpty', 'case end', 'uri.host input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3246
     * @tc.name      testUriHostLeadingSpace
     * @tc.desc      Checks that the leadingspace value is reported with MODULE_SKILL_URI_HOST_WHITESPACE by
     * @tc.desc      the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostLeadingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = ' example.com';
      TestLog.text('testUriHostLeadingSpace', 'case begin', 'uri.host input leadingspace');
      TestLog.step('testUriHostLeadingSpace', 'uri.host input leadingspace');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostLeadingSpace', 'uri.host', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_HOST_WHITESPACE');
      TestLog.flag('testUriHostLeadingSpace', 'has code MODULE_SKILL_URI_HOST_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriHostLeadingSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostLeadingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostLeadingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostLeadingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostLeadingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostLeadingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostLeadingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostLeadingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriHostLeadingSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostLeadingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostLeadingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostLeadingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostLeadingSpace', 'case end', 'uri.host input leadingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3247
     * @tc.name      testUriHostInnerSpace
     * @tc.desc      Checks that the innerspace value is reported with MODULE_SKILL_URI_HOST_WHITESPACE by
     * @tc.desc      the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostInnerSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'example .com';
      TestLog.text('testUriHostInnerSpace', 'case begin', 'uri.host input innerspace');
      TestLog.step('testUriHostInnerSpace', 'uri.host input innerspace');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostInnerSpace', 'uri.host', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_HOST_WHITESPACE');
      TestLog.flag('testUriHostInnerSpace', 'has code MODULE_SKILL_URI_HOST_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriHostInnerSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostInnerSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostInnerSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostInnerSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostInnerSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostInnerSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostInnerSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostInnerSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriHostInnerSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostInnerSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostInnerSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostInnerSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostInnerSpace', 'case end', 'uri.host input innerspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3248
     * @tc.name      testUriHostTrailingSpace
     * @tc.desc      Checks that the trailingspace value is reported with MODULE_SKILL_URI_HOST_WHITESPACE by
     * @tc.desc      the uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostTrailingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'example.com ';
      TestLog.text('testUriHostTrailingSpace', 'case begin', 'uri.host input trailingspace');
      TestLog.step('testUriHostTrailingSpace', 'uri.host input trailingspace');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostTrailingSpace', 'uri.host', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_HOST_WHITESPACE');
      TestLog.flag('testUriHostTrailingSpace', 'has code MODULE_SKILL_URI_HOST_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriHostTrailingSpace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostTrailingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostTrailingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostTrailingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostTrailingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostTrailingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostTrailingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostTrailingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriHostTrailingSpace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostTrailingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostTrailingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostTrailingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostTrailingSpace', 'case end', 'uri.host input trailingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3249
     * @tc.name      testUriHostTab
     * @tc.desc      Checks that the tab value is reported with MODULE_SKILL_URI_HOST_WHITESPACE by the
     * @tc.desc      uri.host rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriHostTab',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'exam\tple.com';
      TestLog.text('testUriHostTab', 'case begin', 'uri.host input tab');
      TestLog.step('testUriHostTab', 'uri.host input tab');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriHostTab', 'uri.host', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_HOST_WHITESPACE');
      TestLog.flag('testUriHostTab', 'has code MODULE_SKILL_URI_HOST_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriHostTab', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriHostTab', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriHostTab', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriHostTab', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriHostTab', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriHostTab', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriHostTab', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriHostTab', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriHostTab', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriHostTab', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriHostTab', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriHostTab', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriHostTab', 'case end', 'uri.host input tab');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3260
     * @tc.name      testUriPathRoot
     * @tc.desc      Checks that the root value is accepted by the uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathRoot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = '/';
      TestLog.text('testUriPathRoot', 'case begin', 'uri.path input root');
      TestLog.step('testUriPathRoot', 'uri.path input root');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathRoot', 'uri.path', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriPathRoot', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathRoot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathRoot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathRoot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathRoot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathRoot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathRoot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathRoot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathRoot', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathRoot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathRoot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathRoot', 'case end', 'uri.path input root');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3261
     * @tc.name      testUriPathIndex
     * @tc.desc      Checks that the index value is accepted by the uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathIndex',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = '/index';
      TestLog.text('testUriPathIndex', 'case begin', 'uri.path input index');
      TestLog.step('testUriPathIndex', 'uri.path input index');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathIndex', 'uri.path', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriPathIndex', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathIndex', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathIndex', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathIndex', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathIndex', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathIndex', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathIndex', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathIndex', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathIndex', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathIndex', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathIndex', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathIndex', 'case end', 'uri.path input index');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3262
     * @tc.name      testUriPathNested
     * @tc.desc      Checks that the nested value is accepted by the uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathNested',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = '/a/b/c';
      TestLog.text('testUriPathNested', 'case begin', 'uri.path input nested');
      TestLog.step('testUriPathNested', 'uri.path input nested');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathNested', 'uri.path', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriPathNested', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathNested', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathNested', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathNested', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathNested', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathNested', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathNested', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathNested', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathNested', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathNested', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathNested', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathNested', 'case end', 'uri.path input nested');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3263
     * @tc.name      testUriPathFile
     * @tc.desc      Checks that the file value is accepted by the uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathFile',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = '/index.html';
      TestLog.text('testUriPathFile', 'case begin', 'uri.path input file');
      TestLog.step('testUriPathFile', 'uri.path input file');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathFile', 'uri.path', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriPathFile', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathFile', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathFile', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathFile', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathFile', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathFile', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathFile', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathFile', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathFile', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathFile', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathFile', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathFile', 'case end', 'uri.path input file');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3264
     * @tc.name      testUriPathEmpty
     * @tc.desc      Checks that the empty value is accepted by the uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = '';
      TestLog.text('testUriPathEmpty', 'case begin', 'uri.path input empty');
      TestLog.step('testUriPathEmpty', 'uri.path input empty');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathEmpty', 'uri.path', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriPathEmpty', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathEmpty', 'case end', 'uri.path input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3265
     * @tc.name      testUriPathNoSlash
     * @tc.desc      Checks that the noslash value is reported with MODULE_SKILL_URI_PATH_PREFIX by the
     * @tc.desc      uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathNoSlash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = 'index';
      TestLog.text('testUriPathNoSlash', 'case begin', 'uri.path input noslash');
      TestLog.step('testUriPathNoSlash', 'uri.path input noslash');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathNoSlash', 'uri.path', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_PATH_PREFIX');
      TestLog.flag('testUriPathNoSlash', 'has code MODULE_SKILL_URI_PATH_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriPathNoSlash', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathNoSlash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathNoSlash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathNoSlash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathNoSlash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathNoSlash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathNoSlash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathNoSlash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriPathNoSlash', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathNoSlash', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathNoSlash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathNoSlash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathNoSlash', 'case end', 'uri.path input noslash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3266
     * @tc.name      testUriPathNoSlashFile
     * @tc.desc      Checks that the noslashfile value is reported with MODULE_SKILL_URI_PATH_PREFIX by the
     * @tc.desc      uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathNoSlashFile',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = 'index.html';
      TestLog.text('testUriPathNoSlashFile', 'case begin', 'uri.path input noslashfile');
      TestLog.step('testUriPathNoSlashFile', 'uri.path input noslashfile');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathNoSlashFile', 'uri.path', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_PATH_PREFIX');
      TestLog.flag('testUriPathNoSlashFile', 'has code MODULE_SKILL_URI_PATH_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriPathNoSlashFile', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathNoSlashFile', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathNoSlashFile', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathNoSlashFile', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathNoSlashFile', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathNoSlashFile', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathNoSlashFile', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathNoSlashFile', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriPathNoSlashFile', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathNoSlashFile', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathNoSlashFile', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathNoSlashFile', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathNoSlashFile', 'case end', 'uri.path input noslashfile');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3267
     * @tc.name      testUriPathSpaceSlash
     * @tc.desc      Checks that the spaceslash value is reported with MODULE_SKILL_URI_PATH_PREFIX by the
     * @tc.desc      uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathSpaceSlash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = ' /index';
      TestLog.text('testUriPathSpaceSlash', 'case begin', 'uri.path input spaceslash');
      TestLog.step('testUriPathSpaceSlash', 'uri.path input spaceslash');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathSpaceSlash', 'uri.path', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_PATH_PREFIX');
      TestLog.flag('testUriPathSpaceSlash', 'has code MODULE_SKILL_URI_PATH_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriPathSpaceSlash', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathSpaceSlash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathSpaceSlash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathSpaceSlash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathSpaceSlash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathSpaceSlash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathSpaceSlash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathSpaceSlash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriPathSpaceSlash', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathSpaceSlash', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathSpaceSlash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathSpaceSlash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathSpaceSlash', 'case end', 'uri.path input spaceslash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3268
     * @tc.name      testUriPathDoubleSlash
     * @tc.desc      Checks that the doubleslash value is accepted by the uri.path rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriPathDoubleSlash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.path = '//index';
      TestLog.text('testUriPathDoubleSlash', 'case begin', 'uri.path input doubleslash');
      TestLog.step('testUriPathDoubleSlash', 'uri.path input doubleslash');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriPathDoubleSlash', 'uri.path', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriPathDoubleSlash', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriPathDoubleSlash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriPathDoubleSlash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriPathDoubleSlash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriPathDoubleSlash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriPathDoubleSlash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriPathDoubleSlash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriPathDoubleSlash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriPathDoubleSlash', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriPathDoubleSlash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriPathDoubleSlash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriPathDoubleSlash', 'case end', 'uri.path input doubleslash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3300
     * @tc.name      testUriEmptyConfig
     * @tc.desc      Checks that the empty uri configuration reports only the empty scheme.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriEmptyConfig',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      TestLog.text('testUriEmptyConfig', 'case begin', 'empty uri check');
      TestLog.step('testUriEmptyConfig', 'empty uri check');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriEmptyConfig', 'uri findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_EMPTY');
      TestLog.flag('testUriEmptyConfig', 'has code MODULE_SKILL_URI_SCHEME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriEmptyConfig', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriEmptyConfig', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriEmptyConfig', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriEmptyConfig', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriEmptyConfig', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriEmptyConfig', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriEmptyConfig', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriEmptyConfig', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriEmptyConfig', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriEmptyConfig', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriEmptyConfig', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriEmptyConfig', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriEmptyConfig', 'case end', 'empty uri check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3301
     * @tc.name      testUriFullSample
     * @tc.desc      Checks that the full sample uri passes validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriFullSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.host = 'www.example.com';
      uri.path = '/index';
      TestLog.text('testUriFullSample', 'case begin', 'full sample uri check');
      TestLog.step('testUriFullSample', 'full sample uri check');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriFullSample', 'uri findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriFullSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriFullSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriFullSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriFullSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriFullSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriFullSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriFullSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriFullSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriFullSample', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriFullSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriFullSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriFullSample', 'case end', 'full sample uri check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3302
     * @tc.name      testUriAllFieldsInvalid
     * @tc.desc      Checks that all invalid uri fields are reported together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriAllFieldsInvalid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = 'HTTPS';
      uri.host = 'example .com';
      uri.path = 'index';
      TestLog.text('testUriAllFieldsInvalid', 'case begin', 'combined uri check');
      TestLog.step('testUriAllFieldsInvalid', 'combined uri check');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriAllFieldsInvalid', 'uri findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_SCHEME_ILLEGAL');
      TestLog.flag('testUriAllFieldsInvalid', 'has code MODULE_SKILL_URI_SCHEME_ILLEGAL', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_HOST_WHITESPACE');
      TestLog.flag('testUriAllFieldsInvalid', 'has code MODULE_SKILL_URI_HOST_WHITESPACE', hasExpected2);
      expect(hasExpected2).assertTrue();
      const hasExpected3: boolean = FindingUtils.hasCode(findings, 'MODULE_SKILL_URI_PATH_PREFIX');
      TestLog.flag('testUriAllFieldsInvalid', 'has code MODULE_SKILL_URI_PATH_PREFIX', hasExpected3);
      expect(hasExpected3).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testUriAllFieldsInvalid', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriAllFieldsInvalid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriAllFieldsInvalid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriAllFieldsInvalid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriAllFieldsInvalid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriAllFieldsInvalid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriAllFieldsInvalid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriAllFieldsInvalid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testUriAllFieldsInvalid', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriAllFieldsInvalid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriAllFieldsInvalid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriAllFieldsInvalid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriAllFieldsInvalid', 'case end', 'combined uri check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_3303
     * @tc.name      testUriTrimmedScheme
     * @tc.desc      Checks that a scheme with surrounding whitespace is trimmed before validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testUriTrimmedScheme',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const uri: UriConfig = ConfigFactory.emptyUri();
      uri.scheme = 'https';
      uri.scheme = ' https ';
      TestLog.text('testUriTrimmedScheme', 'case begin', 'trimmed scheme check');
      TestLog.step('testUriTrimmedScheme', 'trimmed scheme check');
      const findings: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.findings('testUriTrimmedScheme', 'uri findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testUriTrimmedScheme', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testUriTrimmedScheme', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testUriTrimmedScheme', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testUriTrimmedScheme', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testUriTrimmedScheme', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testUriTrimmedScheme', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testUriTrimmedScheme', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testUriTrimmedScheme', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testUriTrimmedScheme', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateUri(uri, 'module.abilities[0].skills[0].uris[0]');
      TestLog.number('testUriTrimmedScheme', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testUriTrimmedScheme', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testUriTrimmedScheme', 'case end', 'trimmed scheme check');
    })

  })
}
