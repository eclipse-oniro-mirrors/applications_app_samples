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
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeFeature', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeFeature', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeFeature', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeFeature', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeFeature', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeFeature', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeFeature', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeFeature', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeFeature', 'case end', 'moduleType input feature');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1326
     * @tc.name      testModuleTypeShared
     * @tc.desc      Checks that the the shared module type is accepted by the moduleType rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeShared',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'shared';
      TestLog.text('testModuleTypeShared', 'case begin', 'moduleType input shared');
      TestLog.step('testModuleTypeShared', 'moduleType input shared');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeShared', 'moduleType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleTypeShared', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeShared', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeShared', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeShared', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeShared', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeShared', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeShared', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeShared', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeShared', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeShared', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeShared', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeShared', 'case end', 'moduleType input shared');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1327
     * @tc.name      testModuleTypeTrailingSpace
     * @tc.desc      Checks that the a module type with trailing whitespace is accepted by the moduleType
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleTypeTrailingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'entry ';
      TestLog.text('testModuleTypeTrailingSpace', 'case begin', 'moduleType input trailingspace');
      TestLog.step('testModuleTypeTrailingSpace', 'moduleType input trailingspace');
      const findings: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.findings('testModuleTypeTrailingSpace', 'moduleType', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleTypeTrailingSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleTypeTrailingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleTypeTrailingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleTypeTrailingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleTypeTrailingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleTypeTrailingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleTypeTrailingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleTypeTrailingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleTypeTrailingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateType(moduleConfig);
      TestLog.number('testModuleTypeTrailingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleTypeTrailingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleTypeTrailingSpace', 'case end', 'moduleType input trailingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1328
     * @tc.name      testModuleDescriptionEmpty
     * @tc.desc      Checks that the an empty module description reference is reported with
     * @tc.desc      RESOURCE_REF_EMPTY by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = '';
      TestLog.text('testModuleDescriptionEmpty', 'case begin', 'module description reference input empty');
      TestLog.step('testModuleDescriptionEmpty', 'module description reference input empty');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionEmpty', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY');
      TestLog.flag('testModuleDescriptionEmpty', 'has code RESOURCE_REF_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionEmpty', 'case end', 'module description reference input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1329
     * @tc.name      testModuleDescriptionNoDollar
     * @tc.desc      Checks that the a module description reference without a dollar sign is reported with
     * @tc.desc      RESOURCE_REF_NO_DOLLAR by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionNoDollar',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = 'string:module_desc';
      TestLog.text('testModuleDescriptionNoDollar', 'case begin', 'module description reference input nodollar');
      TestLog.step('testModuleDescriptionNoDollar', 'module description reference input nodollar');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionNoDollar', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_NO_DOLLAR');
      TestLog.flag('testModuleDescriptionNoDollar', 'has code RESOURCE_REF_NO_DOLLAR', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionNoDollar', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionNoDollar', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionNoDollar', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionNoDollar', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionNoDollar', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionNoDollar', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionNoDollar', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionNoDollar', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionNoDollar', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionNoDollar', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionNoDollar', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionNoDollar', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionNoDollar', 'case end', 'module description reference input nodollar');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1330
     * @tc.name      testModuleDescriptionMediaKind
     * @tc.desc      Checks that the a module description reference using the media kind is reported with
     * @tc.desc      RESOURCE_REF_KIND_MISMATCH by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionMediaKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = '$media:module_desc';
      TestLog.text('testModuleDescriptionMediaKind', 'case begin', 'module description reference input mediakind');
      TestLog.step('testModuleDescriptionMediaKind', 'module description reference input mediakind');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionMediaKind', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testModuleDescriptionMediaKind', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionMediaKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionMediaKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionMediaKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionMediaKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionMediaKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionMediaKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionMediaKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionMediaKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionMediaKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionMediaKind', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionMediaKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionMediaKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionMediaKind', 'case end', 'module description reference input mediakind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1331
     * @tc.name      testModuleDescriptionUnknownKind
     * @tc.desc      Checks that the a module description reference with an unknown kind is reported with
     * @tc.desc      RESOURCE_REF_UNKNOWN_KIND by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionUnknownKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = '$text:module_desc';
      TestLog.text('testModuleDescriptionUnknownKind', 'case begin', 'module description reference input unknownkind');
      TestLog.step('testModuleDescriptionUnknownKind', 'module description reference input unknownkind');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionUnknownKind', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_UNKNOWN_KIND');
      TestLog.flag('testModuleDescriptionUnknownKind', 'has code RESOURCE_REF_UNKNOWN_KIND', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionUnknownKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionUnknownKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionUnknownKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionUnknownKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionUnknownKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionUnknownKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionUnknownKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionUnknownKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionUnknownKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionUnknownKind', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionUnknownKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionUnknownKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionUnknownKind', 'case end', 'module description reference input unknownkind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1332
     * @tc.name      testModuleDescriptionEmptyName
     * @tc.desc      Checks that the a module description reference with an empty name is reported with
     * @tc.desc      RESOURCE_REF_EMPTY_NAME by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = '$string:';
      TestLog.text('testModuleDescriptionEmptyName', 'case begin', 'module description reference input emptyname');
      TestLog.step('testModuleDescriptionEmptyName', 'module description reference input emptyname');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionEmptyName', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testModuleDescriptionEmptyName', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionEmptyName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionEmptyName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionEmptyName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionEmptyName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionEmptyName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionEmptyName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionEmptyName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionEmptyName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionEmptyName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionEmptyName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionEmptyName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionEmptyName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionEmptyName', 'case end', 'module description reference input emptyname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1333
     * @tc.name      testModuleDescriptionHyphenName
     * @tc.desc      Checks that the a module description reference with a hyphen is reported with
     * @tc.desc      RESOURCE_REF_ILLEGAL_NAME by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionHyphenName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = '$string:module-desc';
      TestLog.text('testModuleDescriptionHyphenName', 'case begin', 'module description reference input hyphenname');
      TestLog.step('testModuleDescriptionHyphenName', 'module description reference input hyphenname');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionHyphenName', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testModuleDescriptionHyphenName', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionHyphenName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionHyphenName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionHyphenName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionHyphenName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionHyphenName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionHyphenName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionHyphenName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionHyphenName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionHyphenName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionHyphenName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionHyphenName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionHyphenName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionHyphenName', 'case end', 'module description reference input hyphenname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1334
     * @tc.name      testModuleDescriptionWhitespace
     * @tc.desc      Checks that the a module description reference with leading whitespace is reported with
     * @tc.desc      RESOURCE_REF_WHITESPACE by the module description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = ' $string:module_desc';
      TestLog.text('testModuleDescriptionWhitespace', 'case begin', 'module description reference input whitespace');
      TestLog.step('testModuleDescriptionWhitespace', 'module description reference input whitespace');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionWhitespace', 'module description reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_WHITESPACE');
      TestLog.flag('testModuleDescriptionWhitespace', 'has code RESOURCE_REF_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleDescriptionWhitespace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleDescriptionWhitespace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionWhitespace', 'case end', 'module description reference input whitespace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1335
     * @tc.name      testModuleDescriptionSample
     * @tc.desc      Checks that the the sample module description reference is accepted by the module
     * @tc.desc      description reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleDescriptionSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.description = '$string:module_desc';
      TestLog.text('testModuleDescriptionSample', 'case begin', 'module description reference input sample');
      TestLog.step('testModuleDescriptionSample', 'module description reference input sample');
      const findings: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.findings('testModuleDescriptionSample', 'module description reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleDescriptionSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleDescriptionSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleDescriptionSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleDescriptionSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleDescriptionSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleDescriptionSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleDescriptionSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleDescriptionSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleDescriptionSample', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateDescription(moduleConfig);
      TestLog.number('testModuleDescriptionSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleDescriptionSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleDescriptionSample', 'case end', 'module description reference input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1336
     * @tc.name      testModuleMainElementEmpty
     * @tc.desc      Checks that the an empty main element is reported with MODULE_MAIN_ELEMENT_EMPTY by the
     * @tc.desc      mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = '';
      TestLog.text('testModuleMainElementEmpty', 'case begin', 'mainElement input empty');
      TestLog.step('testModuleMainElementEmpty', 'mainElement input empty');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementEmpty', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_EMPTY');
      TestLog.flag('testModuleMainElementEmpty', 'has code MODULE_MAIN_ELEMENT_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementEmpty', 'case end', 'mainElement input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1337
     * @tc.name      testModuleMainElementBlank
     * @tc.desc      Checks that the a blank main element is reported with MODULE_MAIN_ELEMENT_EMPTY by the
     * @tc.desc      mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = '   ';
      TestLog.text('testModuleMainElementBlank', 'case begin', 'mainElement input blank');
      TestLog.step('testModuleMainElementBlank', 'mainElement input blank');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementBlank', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_EMPTY');
      TestLog.flag('testModuleMainElementBlank', 'has code MODULE_MAIN_ELEMENT_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementBlank', 'case end', 'mainElement input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1338
     * @tc.name      testModuleMainElementTooLong
     * @tc.desc      Checks that the a main element longer than the maximum length is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_TOO_LONG by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementTooLong',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = NameUtils.repeat('A', 129);
      TestLog.text('testModuleMainElementTooLong', 'case begin', 'mainElement input toolong');
      TestLog.step('testModuleMainElementTooLong', 'mainElement input toolong');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementTooLong', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_TOO_LONG');
      TestLog.flag('testModuleMainElementTooLong', 'has code MODULE_MAIN_ELEMENT_TOO_LONG', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementTooLong', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementTooLong', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementTooLong', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementTooLong', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementTooLong', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementTooLong', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementTooLong', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementTooLong', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementTooLong', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementTooLong', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementTooLong', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementTooLong', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementTooLong', 'case end', 'mainElement input toolong');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1339
     * @tc.name      testModuleMainElementLowercase
     * @tc.desc      Checks that the a main element starting with a lower case letter is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_INVALID_NAME by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementLowercase',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'entryAbility';
      TestLog.text('testModuleMainElementLowercase', 'case begin', 'mainElement input lowercase');
      TestLog.step('testModuleMainElementLowercase', 'mainElement input lowercase');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementLowercase', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_INVALID_NAME');
      TestLog.flag('testModuleMainElementLowercase', 'has code MODULE_MAIN_ELEMENT_INVALID_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementLowercase', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementLowercase', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementLowercase', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementLowercase', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementLowercase', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementLowercase', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementLowercase', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementLowercase', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementLowercase', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementLowercase', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementLowercase', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementLowercase', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementLowercase', 'case end', 'mainElement input lowercase');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1340
     * @tc.name      testModuleMainElementSnake
     * @tc.desc      Checks that the a main element using snake case is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_INVALID_NAME by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementSnake',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'entry_ability';
      TestLog.text('testModuleMainElementSnake', 'case begin', 'mainElement input snake');
      TestLog.step('testModuleMainElementSnake', 'mainElement input snake');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementSnake', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_INVALID_NAME');
      TestLog.flag('testModuleMainElementSnake', 'has code MODULE_MAIN_ELEMENT_INVALID_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementSnake', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementSnake', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementSnake', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementSnake', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementSnake', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementSnake', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementSnake', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementSnake', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementSnake', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementSnake', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementSnake', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementSnake', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementSnake', 'case end', 'mainElement input snake');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1341
     * @tc.name      testModuleMainElementHyphen
     * @tc.desc      Checks that the a main element containing a hyphen is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_INVALID_NAME by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'Entry-Ability';
      TestLog.text('testModuleMainElementHyphen', 'case begin', 'mainElement input hyphen');
      TestLog.step('testModuleMainElementHyphen', 'mainElement input hyphen');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementHyphen', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_INVALID_NAME');
      TestLog.flag('testModuleMainElementHyphen', 'has code MODULE_MAIN_ELEMENT_INVALID_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementHyphen', 'case end', 'mainElement input hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1342
     * @tc.name      testModuleMainElementDigitStart
     * @tc.desc      Checks that the a main element starting with a digit is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_INVALID_NAME by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementDigitStart',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = '1EntryAbility';
      TestLog.text('testModuleMainElementDigitStart', 'case begin', 'mainElement input digitstart');
      TestLog.step('testModuleMainElementDigitStart', 'mainElement input digitstart');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementDigitStart', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_INVALID_NAME');
      TestLog.flag('testModuleMainElementDigitStart', 'has code MODULE_MAIN_ELEMENT_INVALID_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementDigitStart', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementDigitStart', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementDigitStart', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementDigitStart', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementDigitStart', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementDigitStart', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementDigitStart', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementDigitStart', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementDigitStart', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementDigitStart', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementDigitStart', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementDigitStart', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementDigitStart', 'case end', 'mainElement input digitstart');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1343
     * @tc.name      testModuleMainElementUnknown
     * @tc.desc      Checks that the a main element that matches no ability is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementUnknown',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'MissingAbility';
      TestLog.text('testModuleMainElementUnknown', 'case begin', 'mainElement input unknown');
      TestLog.step('testModuleMainElementUnknown', 'mainElement input unknown');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementUnknown', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY');
      TestLog.flag('testModuleMainElementUnknown', 'has code MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementUnknown', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementUnknown', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementUnknown', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementUnknown', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementUnknown', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementUnknown', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementUnknown', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementUnknown', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementUnknown', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementUnknown', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementUnknown', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementUnknown', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementUnknown', 'case end', 'mainElement input unknown');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1344
     * @tc.name      testModuleMainElementSample
     * @tc.desc      Checks that the the sample main element is accepted by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      TestLog.text('testModuleMainElementSample', 'case begin', 'mainElement input sample');
      TestLog.step('testModuleMainElementSample', 'mainElement input sample');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementSample', 'mainElement', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleMainElementSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementSample', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementSample', 'case end', 'mainElement input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1345
     * @tc.name      testModuleMainElementFeatureAbility
     * @tc.desc      Checks that the a main element that only exists in another module is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementFeatureAbility',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'FeatureAbility';
      TestLog.text('testModuleMainElementFeatureAbility', 'case begin', 'mainElement input featureability');
      TestLog.step('testModuleMainElementFeatureAbility', 'mainElement input featureability');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementFeatureAbility', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY');
      TestLog.flag('testModuleMainElementFeatureAbility', 'has code MODULE_MAIN_ELEMENT_UNKNOWN_ABILITY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementFeatureAbility', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementFeatureAbility', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementFeatureAbility', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementFeatureAbility', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementFeatureAbility', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementFeatureAbility', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementFeatureAbility', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementFeatureAbility', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementFeatureAbility', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementFeatureAbility', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementFeatureAbility', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementFeatureAbility', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementFeatureAbility', 'case end', 'mainElement input featureability');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1346
     * @tc.name      testModuleMainElementNotExported
     * @tc.desc      Checks that the a main element whose ability is not exported is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_NOT_EXPORTED by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementNotExported',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      moduleConfig.abilities[0].exported = false;
      TestLog.text('testModuleMainElementNotExported', 'case begin', 'mainElement input notexported');
      TestLog.step('testModuleMainElementNotExported', 'mainElement input notexported');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementNotExported', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NOT_EXPORTED');
      TestLog.flag('testModuleMainElementNotExported', 'has code MODULE_MAIN_ELEMENT_NOT_EXPORTED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementNotExported', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementNotExported', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementNotExported', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementNotExported', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementNotExported', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementNotExported', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementNotExported', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementNotExported', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementNotExported', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementNotExported', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementNotExported', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementNotExported', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementNotExported', 'case end', 'mainElement input notexported');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1347
     * @tc.name      testModuleMainElementNoHomeEntity
     * @tc.desc      Checks that the a main ability without the home entity is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_NO_HOME_ENTITY by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementNoHomeEntity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      moduleConfig.abilities[0].skills[0].entities = [];
      TestLog.text('testModuleMainElementNoHomeEntity', 'case begin', 'mainElement input nohomeentity');
      TestLog.step('testModuleMainElementNoHomeEntity', 'mainElement input nohomeentity');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementNoHomeEntity', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NO_HOME_ENTITY');
      TestLog.flag('testModuleMainElementNoHomeEntity', 'has code MODULE_MAIN_ELEMENT_NO_HOME_ENTITY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementNoHomeEntity', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementNoHomeEntity', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementNoHomeEntity', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementNoHomeEntity', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementNoHomeEntity', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementNoHomeEntity', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementNoHomeEntity', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementNoHomeEntity', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementNoHomeEntity', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementNoHomeEntity', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementNoHomeEntity', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementNoHomeEntity', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementNoHomeEntity', 'case end', 'mainElement input nohomeentity');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1348
     * @tc.name      testModuleMainElementNoHomeAction
     * @tc.desc      Checks that the a main ability without the home action is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_NO_HOME_ACTION by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementNoHomeAction',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      moduleConfig.abilities[0].skills[0].actions = [];
      TestLog.text('testModuleMainElementNoHomeAction', 'case begin', 'mainElement input nohomeaction');
      TestLog.step('testModuleMainElementNoHomeAction', 'mainElement input nohomeaction');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementNoHomeAction', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NO_HOME_ACTION');
      TestLog.flag('testModuleMainElementNoHomeAction', 'has code MODULE_MAIN_ELEMENT_NO_HOME_ACTION', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementNoHomeAction', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementNoHomeAction', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementNoHomeAction', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementNoHomeAction', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementNoHomeAction', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementNoHomeAction', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementNoHomeAction', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementNoHomeAction', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementNoHomeAction', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementNoHomeAction', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementNoHomeAction', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementNoHomeAction', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementNoHomeAction', 'case end', 'mainElement input nohomeaction');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1349
     * @tc.name      testModuleMainElementOtherEntity
     * @tc.desc      Checks that the a main ability that declares another entity is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_NO_HOME_ENTITY by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementOtherEntity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      moduleConfig.abilities[0].skills[0].entities = ['entity.system.browsable'];
      TestLog.text('testModuleMainElementOtherEntity', 'case begin', 'mainElement input otherentity');
      TestLog.step('testModuleMainElementOtherEntity', 'mainElement input otherentity');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementOtherEntity', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NO_HOME_ENTITY');
      TestLog.flag('testModuleMainElementOtherEntity', 'has code MODULE_MAIN_ELEMENT_NO_HOME_ENTITY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementOtherEntity', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementOtherEntity', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementOtherEntity', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementOtherEntity', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementOtherEntity', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementOtherEntity', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementOtherEntity', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementOtherEntity', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementOtherEntity', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementOtherEntity', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementOtherEntity', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementOtherEntity', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementOtherEntity', 'case end', 'mainElement input otherentity');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1350
     * @tc.name      testModuleMainElementOtherAction
     * @tc.desc      Checks that the a main ability that declares another action is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_NO_HOME_ACTION by the mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementOtherAction',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      moduleConfig.abilities[0].skills[0].actions = ['ohos.want.action.view_data'];
      TestLog.text('testModuleMainElementOtherAction', 'case begin', 'mainElement input otheraction');
      TestLog.step('testModuleMainElementOtherAction', 'mainElement input otheraction');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementOtherAction', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NO_HOME_ACTION');
      TestLog.flag('testModuleMainElementOtherAction', 'has code MODULE_MAIN_ELEMENT_NO_HOME_ACTION', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementOtherAction', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementOtherAction', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementOtherAction', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementOtherAction', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementOtherAction', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementOtherAction', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementOtherAction', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementOtherAction', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementOtherAction', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementOtherAction', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementOtherAction', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementOtherAction', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementOtherAction', 'case end', 'mainElement input otheraction');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1351
     * @tc.name      testModuleMainElementNoSkills
     * @tc.desc      Checks that the a main ability without any skill is reported with
     * @tc.desc      MODULE_MAIN_ELEMENT_NO_HOME_ENTITY, MODULE_MAIN_ELEMENT_NO_HOME_ACTION by the
     * @tc.desc      mainElement rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleMainElementNoSkills',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.mainElement = 'EntryAbility';
      moduleConfig.abilities[0].skills = [];
      TestLog.text('testModuleMainElementNoSkills', 'case begin', 'mainElement input noskills');
      TestLog.step('testModuleMainElementNoSkills', 'mainElement input noskills');
      const findings: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.findings('testModuleMainElementNoSkills', 'mainElement', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NO_HOME_ENTITY');
      TestLog.flag('testModuleMainElementNoSkills', 'has code MODULE_MAIN_ELEMENT_NO_HOME_ENTITY', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_MAIN_ELEMENT_NO_HOME_ACTION');
      TestLog.flag('testModuleMainElementNoSkills', 'has code MODULE_MAIN_ELEMENT_NO_HOME_ACTION', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleMainElementNoSkills', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleMainElementNoSkills', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleMainElementNoSkills', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleMainElementNoSkills', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleMainElementNoSkills', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleMainElementNoSkills', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleMainElementNoSkills', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleMainElementNoSkills', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleMainElementNoSkills', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleMainElementNoSkills', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateMainElement(moduleConfig);
      TestLog.number('testModuleMainElementNoSkills', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleMainElementNoSkills', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleMainElementNoSkills', 'case end', 'mainElement input noskills');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1352
     * @tc.name      testModuleInstallationDefault
     * @tc.desc      Checks that the the default entry installation flags is accepted by the installation
     * @tc.desc      flags rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleInstallationDefault',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deliveryWithInstall = true;
      TestLog.text('testModuleInstallationDefault', 'case begin', 'installation flags input default');
      TestLog.step('testModuleInstallationDefault', 'installation flags input default');
      const findings: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.findings('testModuleInstallationDefault', 'installation flags', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleInstallationDefault', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleInstallationDefault', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleInstallationDefault', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleInstallationDefault', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleInstallationDefault', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleInstallationDefault', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleInstallationDefault', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleInstallationDefault', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleInstallationDefault', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.number('testModuleInstallationDefault', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleInstallationDefault', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleInstallationDefault', 'case end', 'installation flags input default');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1353
     * @tc.name      testModuleInstallationFreeWithDelivery
     * @tc.desc      Checks that the an installation free entry module with an atomicService block is
     * @tc.desc      accepted by the installation flags rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleInstallationFreeWithDelivery',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deliveryWithInstall = true;
      moduleConfig.installationFree = true;
      TestLog.text('testModuleInstallationFreeWithDelivery', 'case begin', 'installation flags input freewithdelivery');
      TestLog.step('testModuleInstallationFreeWithDelivery', 'installation flags input freewithdelivery');
      const findings: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.findings('testModuleInstallationFreeWithDelivery', 'installation flags', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleInstallationFreeWithDelivery', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleInstallationFreeWithDelivery', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleInstallationFreeWithDelivery', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleInstallationFreeWithDelivery', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleInstallationFreeWithDelivery', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleInstallationFreeWithDelivery', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleInstallationFreeWithDelivery', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleInstallationFreeWithDelivery', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleInstallationFreeWithDelivery', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.number('testModuleInstallationFreeWithDelivery', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleInstallationFreeWithDelivery', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleInstallationFreeWithDelivery', 'case end', 'installation flags input freewithdelivery');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1354
     * @tc.name      testModuleInstallationNotDeliveredFree
     * @tc.desc      Checks that the an entry module that is not delivered but installation free is reported
     * @tc.desc      with MODULE_INSTALLATION_FLAGS_CONFLICT, MODULE_ENTRY_NOT_DELIVERED by the installation
     * @tc.desc      flags rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleInstallationNotDeliveredFree',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deliveryWithInstall = false;
      moduleConfig.installationFree = true;
      TestLog.text('testModuleInstallationNotDeliveredFree', 'case begin', 'installation flags input notdeliveredfree');
      TestLog.step('testModuleInstallationNotDeliveredFree', 'installation flags input notdeliveredfree');
      const findings: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.findings('testModuleInstallationNotDeliveredFree', 'installation flags', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'MODULE_INSTALLATION_FLAGS_CONFLICT');
      TestLog.flag('testModuleInstallationNotDeliveredFree',
        'has code MODULE_INSTALLATION_FLAGS_CONFLICT', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'MODULE_ENTRY_NOT_DELIVERED');
      TestLog.flag('testModuleInstallationNotDeliveredFree', 'has code MODULE_ENTRY_NOT_DELIVERED', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleInstallationNotDeliveredFree', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleInstallationNotDeliveredFree', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleInstallationNotDeliveredFree', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleInstallationNotDeliveredFree', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleInstallationNotDeliveredFree', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleInstallationNotDeliveredFree', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleInstallationNotDeliveredFree', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleInstallationNotDeliveredFree', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleInstallationNotDeliveredFree', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleInstallationNotDeliveredFree', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.number('testModuleInstallationNotDeliveredFree', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleInstallationNotDeliveredFree', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleInstallationNotDeliveredFree', 'case end', 'installation flags input notdeliveredfree');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1355
     * @tc.name      testModuleInstallationNotDelivered
     * @tc.desc      Checks that the an entry module that is not delivered is reported with
     * @tc.desc      MODULE_ENTRY_NOT_DELIVERED by the installation flags rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleInstallationNotDelivered',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deliveryWithInstall = false;
      moduleConfig.installationFree = false;
      TestLog.text('testModuleInstallationNotDelivered', 'case begin', 'installation flags input notdelivered');
      TestLog.step('testModuleInstallationNotDelivered', 'installation flags input notdelivered');
      const findings: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.findings('testModuleInstallationNotDelivered', 'installation flags', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ENTRY_NOT_DELIVERED');
      TestLog.flag('testModuleInstallationNotDelivered', 'has code MODULE_ENTRY_NOT_DELIVERED', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleInstallationNotDelivered', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleInstallationNotDelivered', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleInstallationNotDelivered', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleInstallationNotDelivered', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleInstallationNotDelivered', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleInstallationNotDelivered', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleInstallationNotDelivered', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleInstallationNotDelivered', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleInstallationNotDelivered', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleInstallationNotDelivered', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.number('testModuleInstallationNotDelivered', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleInstallationNotDelivered', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleInstallationNotDelivered', 'case end', 'installation flags input notdelivered');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1356
     * @tc.name      testModuleInstallationFreeWithoutAtomic
     * @tc.desc      Checks that the a free entry module without an atomicService block is reported with
     * @tc.desc      MODULE_ENTRY_FREE_WITHOUT_ATOMIC by the installation flags rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleInstallationFreeWithoutAtomic',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deliveryWithInstall = true;
      moduleConfig.installationFree = true;
      moduleConfig.atomicService = null;
      TestLog.text('testModuleInstallationFreeWithoutAtomic', 
        'case begin', 'installation flags input freewithoutatomic');
      TestLog.step('testModuleInstallationFreeWithoutAtomic', 'installation flags input freewithoutatomic');
      const findings: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.findings('testModuleInstallationFreeWithoutAtomic', 'installation flags', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_ENTRY_FREE_WITHOUT_ATOMIC');
      TestLog.flag('testModuleInstallationFreeWithoutAtomic', 'has code MODULE_ENTRY_FREE_WITHOUT_ATOMIC', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleInstallationFreeWithoutAtomic', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleInstallationFreeWithoutAtomic', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleInstallationFreeWithoutAtomic', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleInstallationFreeWithoutAtomic', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleInstallationFreeWithoutAtomic', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleInstallationFreeWithoutAtomic', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleInstallationFreeWithoutAtomic', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleInstallationFreeWithoutAtomic', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleInstallationFreeWithoutAtomic', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleInstallationFreeWithoutAtomic', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.number('testModuleInstallationFreeWithoutAtomic', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleInstallationFreeWithoutAtomic', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleInstallationFreeWithoutAtomic', 'case end', 'installation flags input freewithoutatomic');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1357
     * @tc.name      testModuleInstallationNotFreeWithoutAtomic
     * @tc.desc      Checks that the an entry module without atomicService that is not free is accepted by
     * @tc.desc      the installation flags rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleInstallationNotFreeWithoutAtomic',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deliveryWithInstall = true;
      moduleConfig.atomicService = null;
      TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 
        'case begin', 'installation flags input notfreewithoutatomic');
      TestLog.step('testModuleInstallationNotFreeWithoutAtomic', 'installation flags input notfreewithoutatomic');
      const findings: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.findings('testModuleInstallationNotFreeWithoutAtomic', 'installation flags', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleInstallationNotFreeWithoutAtomic', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleInstallationNotFreeWithoutAtomic', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleInstallationNotFreeWithoutAtomic', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleInstallationNotFreeWithoutAtomic', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleInstallationNotFreeWithoutAtomic', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateInstallation(moduleConfig);
      TestLog.number('testModuleInstallationNotFreeWithoutAtomic', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleInstallationNotFreeWithoutAtomic', 
        'case end', 'installation flags input notfreewithoutatomic');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1358
     * @tc.name      testModulePagesEmpty
     * @tc.desc      Checks that the an empty pages reference is reported with MODULE_PAGES_EMPTY by the
     * @tc.desc      pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '';
      TestLog.text('testModulePagesEmpty', 'case begin', 'pages reference input empty');
      TestLog.step('testModulePagesEmpty', 'pages reference input empty');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesEmpty', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_EMPTY');
      TestLog.flag('testModulePagesEmpty', 'has code MODULE_PAGES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesEmpty', 'case end', 'pages reference input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1359
     * @tc.name      testModulePagesBlank
     * @tc.desc      Checks that the a blank pages reference is reported with MODULE_PAGES_EMPTY by the pages
     * @tc.desc      reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '  ';
      TestLog.text('testModulePagesBlank', 'case begin', 'pages reference input blank');
      TestLog.step('testModulePagesBlank', 'pages reference input blank');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesBlank', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_EMPTY');
      TestLog.flag('testModulePagesBlank', 'has code MODULE_PAGES_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesBlank', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesBlank', 'case end', 'pages reference input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1360
     * @tc.name      testModulePagesPlainName
     * @tc.desc      Checks that the a pages value without the profile prefix is reported with
     * @tc.desc      MODULE_PAGES_NOT_PROFILE_REF by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesPlainName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = 'main_pages';
      TestLog.text('testModulePagesPlainName', 'case begin', 'pages reference input plainname');
      TestLog.step('testModulePagesPlainName', 'pages reference input plainname');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesPlainName', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testModulePagesPlainName', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesPlainName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesPlainName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesPlainName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesPlainName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesPlainName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesPlainName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesPlainName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesPlainName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesPlainName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesPlainName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesPlainName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesPlainName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesPlainName', 'case end', 'pages reference input plainname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1361
     * @tc.name      testModulePagesStringKind
     * @tc.desc      Checks that the a pages value using the string kind is reported with
     * @tc.desc      MODULE_PAGES_NOT_PROFILE_REF by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesStringKind',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$string:main_pages';
      TestLog.text('testModulePagesStringKind', 'case begin', 'pages reference input stringkind');
      TestLog.step('testModulePagesStringKind', 'pages reference input stringkind');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesStringKind', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testModulePagesStringKind', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesStringKind', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesStringKind', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesStringKind', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesStringKind', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesStringKind', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesStringKind', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesStringKind', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesStringKind', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesStringKind', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesStringKind', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesStringKind', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesStringKind', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesStringKind', 'case end', 'pages reference input stringkind');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1362
     * @tc.name      testModulePagesUppercasePrefix
     * @tc.desc      Checks that the a pages value using an upper case prefix is reported with
     * @tc.desc      MODULE_PAGES_NOT_PROFILE_REF by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesUppercasePrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$PROFILE:main_pages';
      TestLog.text('testModulePagesUppercasePrefix', 'case begin', 'pages reference input uppercaseprefix');
      TestLog.step('testModulePagesUppercasePrefix', 'pages reference input uppercaseprefix');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesUppercasePrefix', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_NOT_PROFILE_REF');
      TestLog.flag('testModulePagesUppercasePrefix', 'has code MODULE_PAGES_NOT_PROFILE_REF', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesUppercasePrefix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesUppercasePrefix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesUppercasePrefix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesUppercasePrefix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesUppercasePrefix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesUppercasePrefix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesUppercasePrefix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesUppercasePrefix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesUppercasePrefix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesUppercasePrefix', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesUppercasePrefix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesUppercasePrefix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesUppercasePrefix', 'case end', 'pages reference input uppercaseprefix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1363
     * @tc.name      testModulePagesEmptyProfileName
     * @tc.desc      Checks that the a pages value with an empty profile name is reported with
     * @tc.desc      MODULE_PAGES_PROFILE_NAME_EMPTY by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesEmptyProfileName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:';
      TestLog.text('testModulePagesEmptyProfileName', 'case begin', 'pages reference input emptyprofilename');
      TestLog.step('testModulePagesEmptyProfileName', 'pages reference input emptyprofilename');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesEmptyProfileName', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_PROFILE_NAME_EMPTY');
      TestLog.flag('testModulePagesEmptyProfileName', 'has code MODULE_PAGES_PROFILE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesEmptyProfileName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesEmptyProfileName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesEmptyProfileName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesEmptyProfileName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesEmptyProfileName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesEmptyProfileName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesEmptyProfileName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesEmptyProfileName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesEmptyProfileName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesEmptyProfileName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesEmptyProfileName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesEmptyProfileName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesEmptyProfileName', 'case end', 'pages reference input emptyprofilename');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1364
     * @tc.name      testModulePagesHyphenName
     * @tc.desc      Checks that the a pages profile name with a hyphen is reported with
     * @tc.desc      MODULE_PAGES_PROFILE_NAME_ILLEGAL by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesHyphenName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:main-pages';
      TestLog.text('testModulePagesHyphenName', 'case begin', 'pages reference input hyphenname');
      TestLog.step('testModulePagesHyphenName', 'pages reference input hyphenname');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesHyphenName', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_PROFILE_NAME_ILLEGAL');
      TestLog.flag('testModulePagesHyphenName', 'has code MODULE_PAGES_PROFILE_NAME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesHyphenName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesHyphenName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesHyphenName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesHyphenName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesHyphenName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesHyphenName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesHyphenName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesHyphenName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesHyphenName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesHyphenName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesHyphenName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesHyphenName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesHyphenName', 'case end', 'pages reference input hyphenname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1365
     * @tc.name      testModulePagesSpaceName
     * @tc.desc      Checks that the a pages profile name with a space is reported with
     * @tc.desc      MODULE_PAGES_PROFILE_NAME_ILLEGAL by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesSpaceName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:main pages';
      TestLog.text('testModulePagesSpaceName', 'case begin', 'pages reference input spacename');
      TestLog.step('testModulePagesSpaceName', 'pages reference input spacename');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesSpaceName', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_PROFILE_NAME_ILLEGAL');
      TestLog.flag('testModulePagesSpaceName', 'has code MODULE_PAGES_PROFILE_NAME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesSpaceName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesSpaceName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesSpaceName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesSpaceName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesSpaceName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesSpaceName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesSpaceName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesSpaceName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesSpaceName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesSpaceName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesSpaceName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesSpaceName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesSpaceName', 'case end', 'pages reference input spacename');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1366
     * @tc.name      testModulePagesDotName
     * @tc.desc      Checks that the a pages profile name with a dot is reported with
     * @tc.desc      MODULE_PAGES_PROFILE_NAME_ILLEGAL by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesDotName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:main_pages.json';
      TestLog.text('testModulePagesDotName', 'case begin', 'pages reference input dotname');
      TestLog.step('testModulePagesDotName', 'pages reference input dotname');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesDotName', 'pages reference', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_PAGES_PROFILE_NAME_ILLEGAL');
      TestLog.flag('testModulePagesDotName', 'has code MODULE_PAGES_PROFILE_NAME_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModulePagesDotName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesDotName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesDotName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesDotName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesDotName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesDotName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesDotName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesDotName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModulePagesDotName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesDotName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesDotName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesDotName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesDotName', 'case end', 'pages reference input dotname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1367
     * @tc.name      testModulePagesSample
     * @tc.desc      Checks that the the sample pages reference is accepted by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:main_pages';
      TestLog.text('testModulePagesSample', 'case begin', 'pages reference input sample');
      TestLog.step('testModulePagesSample', 'pages reference input sample');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesSample', 'pages reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModulePagesSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesSample', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesSample', 'case end', 'pages reference input sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1368
     * @tc.name      testModulePagesSurroundingSpace
     * @tc.desc      Checks that the a pages reference with surrounding whitespace is accepted by the pages
     * @tc.desc      reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesSurroundingSpace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = ' $profile:main_pages ';
      TestLog.text('testModulePagesSurroundingSpace', 'case begin', 'pages reference input surroundingspace');
      TestLog.step('testModulePagesSurroundingSpace', 'pages reference input surroundingspace');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesSurroundingSpace', 'pages reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModulePagesSurroundingSpace', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesSurroundingSpace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesSurroundingSpace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesSurroundingSpace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesSurroundingSpace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesSurroundingSpace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesSurroundingSpace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesSurroundingSpace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesSurroundingSpace', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesSurroundingSpace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesSurroundingSpace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesSurroundingSpace', 'case end', 'pages reference input surroundingspace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1369
     * @tc.name      testModulePagesDigitName
     * @tc.desc      Checks that the a pages profile name starting with a digit is accepted by the pages
     * @tc.desc      reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesDigitName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:1pages';
      TestLog.text('testModulePagesDigitName', 'case begin', 'pages reference input digitname');
      TestLog.step('testModulePagesDigitName', 'pages reference input digitname');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesDigitName', 'pages reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModulePagesDigitName', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesDigitName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesDigitName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesDigitName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesDigitName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesDigitName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesDigitName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesDigitName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesDigitName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesDigitName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesDigitName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesDigitName', 'case end', 'pages reference input digitname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1370
     * @tc.name      testModulePagesLongName
     * @tc.desc      Checks that the a long pages profile name is accepted by the pages reference rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModulePagesLongName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.pages = '$profile:main_pages_profile_for_tablet';
      TestLog.text('testModulePagesLongName', 'case begin', 'pages reference input longname');
      TestLog.step('testModulePagesLongName', 'pages reference input longname');
      const findings: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.findings('testModulePagesLongName', 'pages reference', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModulePagesLongName', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModulePagesLongName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModulePagesLongName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModulePagesLongName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModulePagesLongName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModulePagesLongName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModulePagesLongName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModulePagesLongName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModulePagesLongName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validatePages(moduleConfig);
      TestLog.number('testModulePagesLongName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModulePagesLongName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModulePagesLongName', 'case end', 'pages reference input longname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1371
     * @tc.name      testModuleExtensionEmpty
     * @tc.desc      Checks that the an empty extension ability list is accepted by the extension ability
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [];
      TestLog.text('testModuleExtensionEmpty', 'case begin', 'extension ability input empty');
      TestLog.step('testModuleExtensionEmpty', 'extension ability input empty');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionEmpty', 'extension ability', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleExtensionEmpty', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionEmpty', 'case end', 'extension ability input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1372
     * @tc.name      testModuleExtensionValidBackup
     * @tc.desc      Checks that the a valid backup extension ability is accepted by the extension ability
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionValidBackup',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('BackupExtension', 'backup')];
      TestLog.text('testModuleExtensionValidBackup', 'case begin', 'extension ability input validbackup');
      TestLog.step('testModuleExtensionValidBackup', 'extension ability input validbackup');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionValidBackup', 'extension ability', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleExtensionValidBackup', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionValidBackup', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionValidBackup', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionValidBackup', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionValidBackup', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionValidBackup', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionValidBackup', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionValidBackup', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionValidBackup', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionValidBackup', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionValidBackup', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionValidBackup', 'case end', 'extension ability input validbackup');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1373
     * @tc.name      testModuleExtensionValidDataShare
     * @tc.desc      Checks that the a valid data share extension ability is accepted by the extension
     * @tc.desc      ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionValidDataShare',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('DataShareExtension', 'datashare')];
      TestLog.text('testModuleExtensionValidDataShare', 'case begin', 'extension ability input validdatashare');
      TestLog.step('testModuleExtensionValidDataShare', 'extension ability input validdatashare');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionValidDataShare', 'extension ability', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleExtensionValidDataShare', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionValidDataShare', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionValidDataShare', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionValidDataShare', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionValidDataShare', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionValidDataShare', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionValidDataShare', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionValidDataShare', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionValidDataShare', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionValidDataShare', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionValidDataShare', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionValidDataShare', 'case end', 'extension ability input validdatashare');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1374
     * @tc.name      testModuleExtensionLowercaseName
     * @tc.desc      Checks that the an extension ability name starting with a lower case letter is reported
     * @tc.desc      with MODULE_EXTENSION_NAME_NOT_PASCAL by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionLowercaseName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('backupExtension', 'backup')];
      TestLog.text('testModuleExtensionLowercaseName', 'case begin', 'extension ability input lowercasename');
      TestLog.step('testModuleExtensionLowercaseName', 'extension ability input lowercasename');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionLowercaseName', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_NAME_NOT_PASCAL');
      TestLog.flag('testModuleExtensionLowercaseName', 'has code MODULE_EXTENSION_NAME_NOT_PASCAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionLowercaseName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionLowercaseName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionLowercaseName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionLowercaseName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionLowercaseName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionLowercaseName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionLowercaseName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionLowercaseName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionLowercaseName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionLowercaseName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionLowercaseName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionLowercaseName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionLowercaseName', 'case end', 'extension ability input lowercasename');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1375
     * @tc.name      testModuleExtensionEmptyName
     * @tc.desc      Checks that the an extension ability with an empty name is reported with
     * @tc.desc      MODULE_EXTENSION_NAME_EMPTY by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('', 'backup')];
      TestLog.text('testModuleExtensionEmptyName', 'case begin', 'extension ability input emptyname');
      TestLog.step('testModuleExtensionEmptyName', 'extension ability input emptyname');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionEmptyName', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_NAME_EMPTY');
      TestLog.flag('testModuleExtensionEmptyName', 'has code MODULE_EXTENSION_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionEmptyName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionEmptyName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionEmptyName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionEmptyName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionEmptyName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionEmptyName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionEmptyName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionEmptyName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionEmptyName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionEmptyName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionEmptyName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionEmptyName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionEmptyName', 'case end', 'extension ability input emptyname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1376
     * @tc.name      testModuleExtensionDuplicateName
     * @tc.desc      Checks that the duplicate extension ability names is reported with
     * @tc.desc      MODULE_EXTENSION_NAME_DUPLICATE by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionDuplicateName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = 
        [ConfigFactory.extensionAbility('BackupExtension', 
          'backup'), ConfigFactory.extensionAbility('BackupExtension', 'backup')];
      TestLog.text('testModuleExtensionDuplicateName', 'case begin', 'extension ability input duplicatename');
      TestLog.step('testModuleExtensionDuplicateName', 'extension ability input duplicatename');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionDuplicateName', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_NAME_DUPLICATE');
      TestLog.flag('testModuleExtensionDuplicateName', 'has code MODULE_EXTENSION_NAME_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionDuplicateName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionDuplicateName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionDuplicateName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionDuplicateName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionDuplicateName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionDuplicateName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionDuplicateName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionDuplicateName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionDuplicateName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionDuplicateName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionDuplicateName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionDuplicateName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionDuplicateName', 'case end', 'extension ability input duplicatename');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1377
     * @tc.name      testModuleExtensionEmptyType
     * @tc.desc      Checks that the an extension ability with an empty type is reported with
     * @tc.desc      MODULE_EXTENSION_TYPE_EMPTY by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionEmptyType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('BackupExtension', '')];
      TestLog.text('testModuleExtensionEmptyType', 'case begin', 'extension ability input emptytype');
      TestLog.step('testModuleExtensionEmptyType', 'extension ability input emptytype');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionEmptyType', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_TYPE_EMPTY');
      TestLog.flag('testModuleExtensionEmptyType', 'has code MODULE_EXTENSION_TYPE_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionEmptyType', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionEmptyType', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionEmptyType', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionEmptyType', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionEmptyType', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionEmptyType', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionEmptyType', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionEmptyType', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionEmptyType', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionEmptyType', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionEmptyType', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionEmptyType', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionEmptyType', 'case end', 'extension ability input emptytype');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1378
     * @tc.name      testModuleExtensionUppercaseType
     * @tc.desc      Checks that the an extension ability with an upper case type is reported with
     * @tc.desc      MODULE_EXTENSION_TYPE_ILLEGAL by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionUppercaseType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('BackupExtension', 'Backup')];
      TestLog.text('testModuleExtensionUppercaseType', 'case begin', 'extension ability input uppercasetype');
      TestLog.step('testModuleExtensionUppercaseType', 'extension ability input uppercasetype');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionUppercaseType', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_TYPE_ILLEGAL');
      TestLog.flag('testModuleExtensionUppercaseType', 'has code MODULE_EXTENSION_TYPE_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionUppercaseType', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionUppercaseType', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionUppercaseType', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionUppercaseType', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionUppercaseType', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionUppercaseType', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionUppercaseType', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionUppercaseType', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionUppercaseType', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionUppercaseType', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionUppercaseType', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionUppercaseType', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionUppercaseType', 'case end', 'extension ability input uppercasetype');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1379
     * @tc.name      testModuleExtensionHyphenType
     * @tc.desc      Checks that the an extension ability type with a hyphen is reported with
     * @tc.desc      MODULE_EXTENSION_TYPE_ILLEGAL by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionHyphenType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = [ConfigFactory.extensionAbility('BackupExtension', 'data-share')];
      TestLog.text('testModuleExtensionHyphenType', 'case begin', 'extension ability input hyphentype');
      TestLog.step('testModuleExtensionHyphenType', 'extension ability input hyphentype');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionHyphenType', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_TYPE_ILLEGAL');
      TestLog.flag('testModuleExtensionHyphenType', 'has code MODULE_EXTENSION_TYPE_ILLEGAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionHyphenType', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionHyphenType', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionHyphenType', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionHyphenType', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionHyphenType', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionHyphenType', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionHyphenType', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionHyphenType', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionHyphenType', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionHyphenType', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionHyphenType', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionHyphenType', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionHyphenType', 'case end', 'extension ability input hyphentype');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1380
     * @tc.name      testModuleExtensionEmptySrc
     * @tc.desc      Checks that the an extension ability with an empty source entry is reported with
     * @tc.desc      MODULE_EXTENSION_SRC_EMPTY by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionEmptySrc',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const extension = ConfigFactory.extensionAbility('BackupExtension', 'backup');
      extension.srcEntry = '';
      moduleConfig.extensionAbilities = [extension];
      TestLog.text('testModuleExtensionEmptySrc', 'case begin', 'extension ability input emptysrc');
      TestLog.step('testModuleExtensionEmptySrc', 'extension ability input emptysrc');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionEmptySrc', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_SRC_EMPTY');
      TestLog.flag('testModuleExtensionEmptySrc', 'has code MODULE_EXTENSION_SRC_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionEmptySrc', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionEmptySrc', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionEmptySrc', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionEmptySrc', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionEmptySrc', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionEmptySrc', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionEmptySrc', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionEmptySrc', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionEmptySrc', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionEmptySrc', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionEmptySrc', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionEmptySrc', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionEmptySrc', 'case end', 'extension ability input emptysrc');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1381
     * @tc.name      testModuleExtensionTraversalSrc
     * @tc.desc      Checks that the an extension ability source entry with traversal is reported with
     * @tc.desc      MODULE_EXTENSION_SRC_TRAVERSAL by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionTraversalSrc',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      const extension = ConfigFactory.extensionAbility('BackupExtension', 'backup');
      extension.srcEntry = './ets/../BackupExtension.ets';
      moduleConfig.extensionAbilities = [extension];
      TestLog.text('testModuleExtensionTraversalSrc', 'case begin', 'extension ability input traversalsrc');
      TestLog.step('testModuleExtensionTraversalSrc', 'extension ability input traversalsrc');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionTraversalSrc', 'extension ability', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_EXTENSION_SRC_TRAVERSAL');
      TestLog.flag('testModuleExtensionTraversalSrc', 'has code MODULE_EXTENSION_SRC_TRAVERSAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleExtensionTraversalSrc', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionTraversalSrc', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionTraversalSrc', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionTraversalSrc', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionTraversalSrc', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionTraversalSrc', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionTraversalSrc', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionTraversalSrc', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleExtensionTraversalSrc', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionTraversalSrc', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionTraversalSrc', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionTraversalSrc', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionTraversalSrc', 'case end', 'extension ability input traversalsrc');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1382
     * @tc.name      testModuleExtensionMultipleValid
     * @tc.desc      Checks that the two valid extension abilities is accepted by the extension ability rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleExtensionMultipleValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.extensionAbilities = 
        [ConfigFactory.extensionAbility('BackupExtension', 
          'backup'), ConfigFactory.extensionAbility('FormExtension', 'form')];
      TestLog.text('testModuleExtensionMultipleValid', 'case begin', 'extension ability input multiplevalid');
      TestLog.step('testModuleExtensionMultipleValid', 'extension ability input multiplevalid');
      const findings: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.findings('testModuleExtensionMultipleValid', 'extension ability', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleExtensionMultipleValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleExtensionMultipleValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleExtensionMultipleValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleExtensionMultipleValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleExtensionMultipleValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleExtensionMultipleValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleExtensionMultipleValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleExtensionMultipleValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleExtensionMultipleValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validateExtensionAbilities(moduleConfig);
      TestLog.number('testModuleExtensionMultipleValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleExtensionMultipleValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleExtensionMultipleValid', 'case end', 'extension ability input multiplevalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1500
     * @tc.name      testModuleFullValidationEntryValid
     * @tc.desc      Checks that the sample entry module passes full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleFullValidationEntryValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      TestLog.text('testModuleFullValidationEntryValid', 'case begin', 'full module validation entryvalid');
      TestLog.step('testModuleFullValidationEntryValid', 'full module validation entryvalid');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testModuleFullValidationEntryValid', 'module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleFullValidationEntryValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleFullValidationEntryValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleFullValidationEntryValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleFullValidationEntryValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleFullValidationEntryValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleFullValidationEntryValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleFullValidationEntryValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleFullValidationEntryValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleFullValidationEntryValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testModuleFullValidationEntryValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleFullValidationEntryValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleFullValidationEntryValid', 'case end', 'full module validation entryvalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1501
     * @tc.name      testModuleFullValidationFeatureValid
     * @tc.desc      Checks that the sample feature module passes full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleFullValidationFeatureValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.featureModule();
      TestLog.text('testModuleFullValidationFeatureValid', 'case begin', 'full module validation featurevalid');
      TestLog.step('testModuleFullValidationFeatureValid', 'full module validation featurevalid');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testModuleFullValidationFeatureValid', 'module findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testModuleFullValidationFeatureValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleFullValidationFeatureValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleFullValidationFeatureValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleFullValidationFeatureValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleFullValidationFeatureValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleFullValidationFeatureValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleFullValidationFeatureValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleFullValidationFeatureValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleFullValidationFeatureValid', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testModuleFullValidationFeatureValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleFullValidationFeatureValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleFullValidationFeatureValid', 'case end', 'full module validation featurevalid');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1502
     * @tc.name      testModuleFullValidationEmptyName
     * @tc.desc      Checks that an empty module name is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleFullValidationEmptyName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.name = '';
      TestLog.text('testModuleFullValidationEmptyName', 'case begin', 'full module validation emptyname');
      TestLog.step('testModuleFullValidationEmptyName', 'full module validation emptyname');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testModuleFullValidationEmptyName', 'module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_NAME_EMPTY');
      TestLog.flag('testModuleFullValidationEmptyName', 'has code MODULE_NAME_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleFullValidationEmptyName', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleFullValidationEmptyName', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleFullValidationEmptyName', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleFullValidationEmptyName', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleFullValidationEmptyName', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleFullValidationEmptyName', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleFullValidationEmptyName', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleFullValidationEmptyName', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleFullValidationEmptyName', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleFullValidationEmptyName', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testModuleFullValidationEmptyName', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleFullValidationEmptyName', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleFullValidationEmptyName', 'case end', 'full module validation emptyname');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1503
     * @tc.name      testModuleFullValidationUnknownType
     * @tc.desc      Checks that an unknown module type is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleFullValidationUnknownType',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.type = 'library';
      TestLog.text('testModuleFullValidationUnknownType', 'case begin', 'full module validation unknowntype');
      TestLog.step('testModuleFullValidationUnknownType', 'full module validation unknowntype');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testModuleFullValidationUnknownType', 'module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_TYPE_UNKNOWN');
      TestLog.flag('testModuleFullValidationUnknownType', 'has code MODULE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleFullValidationUnknownType', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleFullValidationUnknownType', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleFullValidationUnknownType', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleFullValidationUnknownType', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleFullValidationUnknownType', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleFullValidationUnknownType', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleFullValidationUnknownType', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleFullValidationUnknownType', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleFullValidationUnknownType', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleFullValidationUnknownType', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testModuleFullValidationUnknownType', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleFullValidationUnknownType', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleFullValidationUnknownType', 'case end', 'full module validation unknowntype');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1504
     * @tc.name      testModuleFullValidationBadDeviceTypes
     * @tc.desc      Checks that an unknown device type is reported during full validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleFullValidationBadDeviceTypes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const moduleConfig: ModuleConfig = ConfigFactory.entryModule();
      moduleConfig.deviceTypes = ['Phone'];
      TestLog.text('testModuleFullValidationBadDeviceTypes', 'case begin', 'full module validation baddevicetypes');
      TestLog.step('testModuleFullValidationBadDeviceTypes', 'full module validation baddevicetypes');
      const findings: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.findings('testModuleFullValidationBadDeviceTypes', 'module findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'MODULE_DEVICE_TYPE_UNKNOWN');
      TestLog.flag('testModuleFullValidationBadDeviceTypes', 'has code MODULE_DEVICE_TYPE_UNKNOWN', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testModuleFullValidationBadDeviceTypes', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testModuleFullValidationBadDeviceTypes', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testModuleFullValidationBadDeviceTypes', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testModuleFullValidationBadDeviceTypes', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testModuleFullValidationBadDeviceTypes', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testModuleFullValidationBadDeviceTypes', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testModuleFullValidationBadDeviceTypes', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testModuleFullValidationBadDeviceTypes', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testModuleFullValidationBadDeviceTypes', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testModuleFullValidationBadDeviceTypes', 'first signature', firstSignature);
      const repeat: Finding[] = ModuleConfigValidator.validate(moduleConfig);
      TestLog.number('testModuleFullValidationBadDeviceTypes', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testModuleFullValidationBadDeviceTypes', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testModuleFullValidationBadDeviceTypes', 'case end', 'full module validation baddevicetypes');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_1505
     * @tc.name      testModuleFullValidationBadMainElement
     * @tc.desc      Checks that an unknown main element is reported during full validation.