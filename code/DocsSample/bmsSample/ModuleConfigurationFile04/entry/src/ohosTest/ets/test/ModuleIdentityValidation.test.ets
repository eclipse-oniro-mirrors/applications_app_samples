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
import type { ModuleConfig } from '../harness/ConfigModels';
import { ModuleConfigValidator } from '../harness/ModuleConfigValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
import { ConfigFactory } from '../harness/ConfigFactory';
import { NameUtils } from '../harness/NameUtils';
export default function ModuleIdentityValidationTest(): void {
  describe('ModuleIdentityValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1300
     * @tc.name      testModuleNameEmpty
     * @tc.desc      Checks that the an empty module name is reported with MODULE_NAME_EMPTY by the
     * @tc.desc      moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      TestLog.text('testModuleNameEmpty', 'case begin', 'moduleName input empty');
      TestLog.step('testModuleNameEmpty', 'moduleName input empty');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameEmpty', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleNameEmpty', 'has code MODULE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameEmpty', 'case end', 'moduleName input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1301
     * @tc.name      testModuleNameBlank
     * @tc.desc      Checks that the a blank module name is reported with MODULE_NAME_EMPTY by the moduleName
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '   ';
      TestLog.text('testModuleNameBlank', 'case begin', 'moduleName input blank');
      TestLog.step('testModuleNameBlank', 'moduleName input blank');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameBlank', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleNameBlank', 'has code MODULE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameBlank', 'case end', 'moduleName input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1302
     * @tc.name      testModuleNameTooLong
     * @tc.desc      Checks that the a module name longer than the maximum length is reported with
     * @tc.desc      MODULE_NAME_TOO_LONG by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = NameUtils.repeat('a', 33);
      TestLog.text('testModuleNameTooLong', 'case begin', 'moduleName input toolong');
      TestLog.step('testModuleNameTooLong', 'moduleName input toolong');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameTooLong', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_TOO_LONG');
      TestLog.flag('testModuleNameTooLong', 'has code MODULE_NAME_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameTooLong', 'case end', 'moduleName input toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1303
     * @tc.name      testModuleNameUppercase
     * @tc.desc      Checks that the an upper case module name is reported with MODULE_NAME_UPPERCASE by the
     * @tc.desc      moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameUppercase',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'Entry';
      TestLog.text('testModuleNameUppercase', 'case begin', 'moduleName input uppercase');
      TestLog.step('testModuleNameUppercase', 'moduleName input uppercase');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameUppercase', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_UPPERCASE');
      TestLog.flag('testModuleNameUppercase', 'has code MODULE_NAME_UPPERCASE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameUppercase', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameUppercase', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameUppercase', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameUppercase', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameUppercase', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameUppercase', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameUppercase', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameUppercase', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameUppercase', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameUppercase', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameUppercase', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameUppercase', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameUppercase', 'case end', 'moduleName input uppercase');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1304
     * @tc.name      testModuleNameWhitespace
     * @tc.desc      Checks that the a module name containing whitespace is reported with
     * @tc.desc      MODULE_NAME_WHITESPACE by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en try';
      TestLog.text('testModuleNameWhitespace', 'case begin', 'moduleName input whitespace');
      TestLog.step('testModuleNameWhitespace', 'moduleName input whitespace');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameWhitespace', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_WHITESPACE');
      TestLog.flag('testModuleNameWhitespace', 'has code MODULE_NAME_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameWhitespace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameWhitespace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameWhitespace', 'case end', 'moduleName input whitespace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1305
     * @tc.name      testModuleNameHyphen
     * @tc.desc      Checks that the a module name with a hyphen is reported with MODULE_NAME_ILLEGAL_CHAR by
     * @tc.desc      the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en-try';
      TestLog.text('testModuleNameHyphen', 'case begin', 'moduleName input hyphen');
      TestLog.step('testModuleNameHyphen', 'moduleName input hyphen');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameHyphen', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleNameHyphen', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameHyphen', 'case end', 'moduleName input hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1306
     * @tc.name      testModuleNameDot
     * @tc.desc      Checks that the a module name with a dot is reported with MODULE_NAME_ILLEGAL_CHAR by
     * @tc.desc      the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameDot',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'en.try';
      TestLog.text('testModuleNameDot', 'case begin', 'moduleName input dot');
      TestLog.step('testModuleNameDot', 'moduleName input dot');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameDot', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_ILLEGAL_CHAR');
      TestLog.flag('testModuleNameDot', 'has code MODULE_NAME_ILLEGAL_CHAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameDot', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameDot', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameDot', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameDot', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameDot', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameDot', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameDot', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameDot', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameDot', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameDot', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameDot', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameDot', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameDot', 'case end', 'moduleName input dot');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1307
     * @tc.name      testModuleNameLeadingDigit
     * @tc.desc      Checks that the a module name starting with a digit is reported with
     * @tc.desc      MODULE_NAME_LEADING_DIGIT by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '9entry';
      TestLog.text('testModuleNameLeadingDigit', 'case begin', 'moduleName input leadingdigit');
      TestLog.step('testModuleNameLeadingDigit', 'moduleName input leadingdigit');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameLeadingDigit', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_LEADING_DIGIT');
      TestLog.flag('testModuleNameLeadingDigit', 'has code MODULE_NAME_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameLeadingDigit', 'case end', 'moduleName input leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1308
     * @tc.name      testModuleNameLeadingUnderscore
     * @tc.desc      Checks that the a module name starting with an underscore is reported with
     * @tc.desc      MODULE_NAME_EDGE_UNDERSCORE by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameLeadingUnderscore',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '_entry';
      TestLog.text('testModuleNameLeadingUnderscore', 'case begin', 'moduleName input leadingunderscore');
      TestLog.step('testModuleNameLeadingUnderscore', 'moduleName input leadingunderscore');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameLeadingUnderscore', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleNameLeadingUnderscore', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameLeadingUnderscore', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameLeadingUnderscore', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameLeadingUnderscore', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameLeadingUnderscore', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameLeadingUnderscore', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameLeadingUnderscore', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameLeadingUnderscore', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameLeadingUnderscore', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameLeadingUnderscore', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameLeadingUnderscore', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameLeadingUnderscore', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameLeadingUnderscore', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameLeadingUnderscore', 'case end', 'moduleName input leadingunderscore');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1309
     * @tc.name      testModuleNameTrailingUnderscore
     * @tc.desc      Checks that the a module name ending with an underscore is reported with
     * @tc.desc      MODULE_NAME_EDGE_UNDERSCORE by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameTrailingUnderscore',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_';
      TestLog.text('testModuleNameTrailingUnderscore', 'case begin', 'moduleName input trailingunderscore');
      TestLog.step('testModuleNameTrailingUnderscore', 'moduleName input trailingunderscore');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameTrailingUnderscore', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EDGE_UNDERSCORE');
      TestLog.flag('testModuleNameTrailingUnderscore', 'has code MODULE_NAME_EDGE_UNDERSCORE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameTrailingUnderscore', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameTrailingUnderscore', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameTrailingUnderscore', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameTrailingUnderscore', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameTrailingUnderscore', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameTrailingUnderscore', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameTrailingUnderscore', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameTrailingUnderscore', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameTrailingUnderscore', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameTrailingUnderscore', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameTrailingUnderscore', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameTrailingUnderscore', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameTrailingUnderscore', 'case end', 'moduleName input trailingunderscore');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1310
     * @tc.name      testModuleNameReservedApp
     * @tc.desc      Checks that the the reserved module name app is reported with MODULE_NAME_RESERVED by
     * @tc.desc      the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameReservedApp',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'app';
      TestLog.text('testModuleNameReservedApp', 'case begin', 'moduleName input reservedapp');
      TestLog.step('testModuleNameReservedApp', 'moduleName input reservedapp');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameReservedApp', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleNameReservedApp', 'has code MODULE_NAME_RESERVED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameReservedApp', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameReservedApp', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameReservedApp', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameReservedApp', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameReservedApp', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameReservedApp', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameReservedApp', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameReservedApp', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameReservedApp', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameReservedApp', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameReservedApp', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameReservedApp', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameReservedApp', 'case end', 'moduleName input reservedapp');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1311
     * @tc.name      testModuleNameReservedApplication
     * @tc.desc      Checks that the the reserved module name application is reported with
     * @tc.desc      MODULE_NAME_RESERVED by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameReservedApplication',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'application';
      TestLog.text('testModuleNameReservedApplication', 'case begin', 'moduleName input reservedapplication');
      TestLog.step('testModuleNameReservedApplication', 'moduleName input reservedapplication');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameReservedApplication', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleNameReservedApplication', 'has code MODULE_NAME_RESERVED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameReservedApplication', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameReservedApplication', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameReservedApplication', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameReservedApplication', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameReservedApplication', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameReservedApplication', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameReservedApplication', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameReservedApplication', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameReservedApplication', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameReservedApplication', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameReservedApplication', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameReservedApplication', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameReservedApplication', 'case end', 'moduleName input reservedapplication');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1312
     * @tc.name      testModuleNameReservedSystem
     * @tc.desc      Checks that the the reserved module name system is reported with MODULE_NAME_RESERVED by
     * @tc.desc      the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameReservedSystem',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'system';
      TestLog.text('testModuleNameReservedSystem', 'case begin', 'moduleName input reservedsystem');
      TestLog.step('testModuleNameReservedSystem', 'moduleName input reservedsystem');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameReservedSystem', 'moduleName', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_RESERVED');
      TestLog.flag('testModuleNameReservedSystem', 'has code MODULE_NAME_RESERVED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleNameReservedSystem', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameReservedSystem', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameReservedSystem', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameReservedSystem', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameReservedSystem', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameReservedSystem', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameReservedSystem', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameReservedSystem', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleNameReservedSystem', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameReservedSystem', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameReservedSystem', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameReservedSystem', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameReservedSystem', 'case end', 'moduleName input reservedsystem');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1313
     * @tc.name      testModuleNameSampleEntry
     * @tc.desc      Checks that the the sample entry module name is accepted by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameSampleEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry';
      TestLog.text('testModuleNameSampleEntry', 'case begin', 'moduleName input sampleentry');
      TestLog.step('testModuleNameSampleEntry', 'moduleName input sampleentry');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameSampleEntry', 'moduleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleNameSampleEntry', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameSampleEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameSampleEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameSampleEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameSampleEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameSampleEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameSampleEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameSampleEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameSampleEntry', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameSampleEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameSampleEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameSampleEntry', 'case end', 'moduleName input sampleentry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1314
     * @tc.name      testModuleNameSampleFeature
     * @tc.desc      Checks that the the sample feature module name is accepted by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameSampleFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'feature';
      TestLog.text('testModuleNameSampleFeature', 'case begin', 'moduleName input samplefeature');
      TestLog.step('testModuleNameSampleFeature', 'moduleName input samplefeature');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameSampleFeature', 'moduleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleNameSampleFeature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameSampleFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameSampleFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameSampleFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameSampleFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameSampleFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameSampleFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameSampleFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameSampleFeature', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameSampleFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameSampleFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameSampleFeature', 'case end', 'moduleName input samplefeature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1315
     * @tc.name      testModuleNameInnerUnderscore
     * @tc.desc      Checks that the a module name with an inner underscore is accepted by the moduleName
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameInnerUnderscore',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'entry_module';
      TestLog.text('testModuleNameInnerUnderscore', 'case begin', 'moduleName input innerunderscore');
      TestLog.step('testModuleNameInnerUnderscore', 'moduleName input innerunderscore');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameInnerUnderscore', 'moduleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleNameInnerUnderscore', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameInnerUnderscore', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameInnerUnderscore', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameInnerUnderscore', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameInnerUnderscore', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameInnerUnderscore', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameInnerUnderscore', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameInnerUnderscore', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameInnerUnderscore', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameInnerUnderscore', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameInnerUnderscore', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameInnerUnderscore', 'case end', 'moduleName input innerunderscore');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1316
     * @tc.name      testModuleNameMaxLength
     * @tc.desc      Checks that the a module name at the maximum length is accepted by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameMaxLength',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = NameUtils.repeat('a', 32);
      TestLog.text('testModuleNameMaxLength', 'case begin', 'moduleName input maxlength');
      TestLog.step('testModuleNameMaxLength', 'moduleName input maxlength');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameMaxLength', 'moduleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleNameMaxLength', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameMaxLength', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameMaxLength', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameMaxLength', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameMaxLength', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameMaxLength', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameMaxLength', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameMaxLength', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameMaxLength', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameMaxLength', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameMaxLength', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameMaxLength', 'case end', 'moduleName input maxlength');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1317
     * @tc.name      testModuleNameDigits
     * @tc.desc      Checks that the a module name containing a digit is accepted by the moduleName rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleNameDigits',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = 'module2';
      TestLog.text('testModuleNameDigits', 'case begin', 'moduleName input digits');
      TestLog.step('testModuleNameDigits', 'moduleName input digits');
      const findings: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.findings('testModuleNameDigits', 'moduleName', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleNameDigits', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleNameDigits', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleNameDigits', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleNameDigits', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleNameDigits', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleNameDigits', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleNameDigits', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleNameDigits', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleNameDigits', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateName(moduleConfig);
      TestLog.number('testModuleNameDigits', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleNameDigits', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleNameDigits', 'case end', 'moduleName input digits');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1318
     * @tc.name      testModuleTypeEmpty
     * @tc.desc      Checks that the an empty module type is reported with MODULE_TYPE_EMPTY by the
     * @tc.desc      moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = '';
      TestLog.text('testModuleTypeEmpty', 'case begin', 'moduleType input empty');
      TestLog.step('testModuleTypeEmpty', 'moduleType input empty');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeEmpty', 'moduleType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleTypeEmpty', 'has code MODULE_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleTypeEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleTypeEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeEmpty', 'case end', 'moduleType input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1319
     * @tc.name      testModuleTypeBlank
     * @tc.desc      Checks that the a blank module type is reported with MODULE_TYPE_EMPTY by the moduleType
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = '  ';
      TestLog.text('testModuleTypeBlank', 'case begin', 'moduleType input blank');
      TestLog.step('testModuleTypeBlank', 'moduleType input blank');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeBlank', 'moduleType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_EMPTY');
      TestLog.flag('testModuleTypeBlank', 'has code MODULE_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleTypeBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleTypeBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeBlank', 'case end', 'moduleType input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1320
     * @tc.name      testModuleTypeUppercase
     * @tc.desc      Checks that the an upper case module type is reported with MODULE_TYPE_UNKNOWN by the
     * @tc.desc      moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeUppercase',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'Entry';
      TestLog.text('testModuleTypeUppercase', 'case begin', 'moduleType input uppercase');
      TestLog.step('testModuleTypeUppercase', 'moduleType input uppercase');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeUppercase', 'moduleType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleTypeUppercase', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleTypeUppercase', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeUppercase', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeUppercase', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeUppercase', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeUppercase', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeUppercase', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeUppercase', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeUppercase', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleTypeUppercase', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeUppercase', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeUppercase', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeUppercase', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeUppercase', 'case end', 'moduleType input uppercase');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1321
     * @tc.name      testModuleTypeUnknown
     * @tc.desc      Checks that the an unknown module type is reported with MODULE_TYPE_UNKNOWN by the
     * @tc.desc      moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'library';
      TestLog.text('testModuleTypeUnknown', 'case begin', 'moduleType input unknown');
      TestLog.step('testModuleTypeUnknown', 'moduleType input unknown');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeUnknown', 'moduleType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleTypeUnknown', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleTypeUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleTypeUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeUnknown', 'case end', 'moduleType input unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1322
     * @tc.name      testModuleTypeHyphen
     * @tc.desc      Checks that the a module type with a hyphen is reported with MODULE_TYPE_UNKNOWN by the
     * @tc.desc      moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'en-try';
      TestLog.text('testModuleTypeHyphen', 'case begin', 'moduleType input hyphen');
      TestLog.step('testModuleTypeHyphen', 'moduleType input hyphen');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeHyphen', 'moduleType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleTypeHyphen', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleTypeHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleTypeHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeHyphen', 'case end', 'moduleType input hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1323
     * @tc.name      testModuleTypeNumeric
     * @tc.desc      Checks that the a numeric module type is reported with MODULE_TYPE_UNKNOWN by the
     * @tc.desc      moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeNumeric',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = '1';
      TestLog.text('testModuleTypeNumeric', 'case begin', 'moduleType input numeric');
      TestLog.step('testModuleTypeNumeric', 'moduleType input numeric');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeNumeric', 'moduleType', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleTypeNumeric', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleTypeNumeric', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeNumeric', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeNumeric', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeNumeric', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeNumeric', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeNumeric', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeNumeric', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeNumeric', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleTypeNumeric', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeNumeric', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeNumeric', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeNumeric', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeNumeric', 'case end', 'moduleType input numeric');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1324
     * @tc.name      testModuleTypeEntry
     * @tc.desc      Checks that the the entry module type is accepted by the moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeEntry',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'entry';
      TestLog.text('testModuleTypeEntry', 'case begin', 'moduleType input entry');
      TestLog.step('testModuleTypeEntry', 'moduleType input entry');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeEntry', 'moduleType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleTypeEntry', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeEntry', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeEntry', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeEntry', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeEntry', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeEntry', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeEntry', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeEntry', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeEntry', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeEntry', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeEntry', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeEntry', 'case end', 'moduleType input entry');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1325
     * @tc.name      testModuleTypeFeature
     * @tc.desc      Checks that the the feature module type is accepted by the moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeFeature',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'feature';
      TestLog.text('testModuleTypeFeature', 'case begin', 'moduleType input feature');
      TestLog.step('testModuleTypeFeature', 'moduleType input feature');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeFeature', 'moduleType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleTypeFeature', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeFeature', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeFeature', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }