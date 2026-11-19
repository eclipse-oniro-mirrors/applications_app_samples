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
import { ResourceReference } from '../harness/ResourceReference';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
export default function ResourceMatrixTest(): void {
  describe('ResourceMatrixTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6600
     * @tc.name      testResourceMatrixStringSample
     * @tc.desc      Checks that the String resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixStringSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'string' + ':' + 'app_name';
      TestLog.text('testResourceMatrixStringSample', 'case begin', 'resource kind string with name sample');
      TestLog.step('testResourceMatrixStringSample', 'resource kind string with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixStringSample', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testResourceMatrixStringSample', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixStringSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixStringSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixStringSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixStringSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixStringSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixStringSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixStringSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixStringSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixStringSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixStringSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixStringSample', 'case end', 'resource kind string with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6601
     * @tc.name      testResourceMatrixStringUpper
     * @tc.desc      Checks that the String resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixStringUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'string' + ':' + 'AppName';
      TestLog.text('testResourceMatrixStringUpper', 'case begin', 'resource kind string with name upper');
      TestLog.step('testResourceMatrixStringUpper', 'resource kind string with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixStringUpper', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testResourceMatrixStringUpper', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixStringUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixStringUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixStringUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixStringUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixStringUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixStringUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixStringUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixStringUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixStringUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixStringUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixStringUpper', 'case end', 'resource kind string with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6602
     * @tc.name      testResourceMatrixStringDigitSuffix
     * @tc.desc      Checks that the String resource reference with name DigitSuffix is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixStringDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'string' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixStringDigitSuffix', 'case begin', 'resource kind string with name digitsuffix');
      TestLog.step('testResourceMatrixStringDigitSuffix', 'resource kind string with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixStringDigitSuffix', 'matrix findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testResourceMatrixStringDigitSuffix', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixStringDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixStringDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixStringDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixStringDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixStringDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixStringDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixStringDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixStringDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixStringDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixStringDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixStringDigitSuffix', 'case end', 'resource kind string with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6603
     * @tc.name      testResourceMatrixStringLeadingDigit
     * @tc.desc      Checks that the String resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixStringLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'string' + ':' + '1app';
      TestLog.text('testResourceMatrixStringLeadingDigit', 'case begin', 'resource kind string with name leadingdigit');
      TestLog.step('testResourceMatrixStringLeadingDigit', 'resource kind string with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixStringLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixStringLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixStringLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixStringLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixStringLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixStringLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixStringLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixStringLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixStringLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixStringLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixStringLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixStringLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixStringLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixStringLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixStringLeadingDigit', 'case end', 'resource kind string with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6604
     * @tc.name      testResourceMatrixStringHyphen
     * @tc.desc      Checks that the String resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixStringHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'string' + ':' + 'app-name';
      TestLog.text('testResourceMatrixStringHyphen', 'case begin', 'resource kind string with name hyphen');
      TestLog.step('testResourceMatrixStringHyphen', 'resource kind string with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixStringHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixStringHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixStringHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixStringHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixStringHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixStringHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixStringHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixStringHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixStringHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixStringHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixStringHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixStringHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixStringHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixStringHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixStringHyphen', 'case end', 'resource kind string with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6605
     * @tc.name      testResourceMatrixStringEmpty
     * @tc.desc      Checks that the String resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixStringEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'string' + ':' + '';
      TestLog.text('testResourceMatrixStringEmpty', 'case begin', 'resource kind string with name empty');
      TestLog.step('testResourceMatrixStringEmpty', 'resource kind string with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixStringEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixStringEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixStringEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixStringEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixStringEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixStringEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixStringEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixStringEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixStringEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixStringEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixStringEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixStringEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixStringEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixStringEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixStringEmpty', 'case end', 'resource kind string with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6606
     * @tc.name      testResourceMatrixMediaSample
     * @tc.desc      Checks that the Media resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixMediaSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'media' + ':' + 'app_name';
      TestLog.text('testResourceMatrixMediaSample', 'case begin', 'resource kind media with name sample');
      TestLog.step('testResourceMatrixMediaSample', 'resource kind media with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixMediaSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixMediaSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixMediaSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixMediaSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixMediaSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixMediaSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixMediaSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixMediaSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixMediaSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixMediaSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixMediaSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixMediaSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixMediaSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixMediaSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixMediaSample', 'case end', 'resource kind media with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6607
     * @tc.name      testResourceMatrixMediaUpper
     * @tc.desc      Checks that the Media resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixMediaUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'media' + ':' + 'AppName';
      TestLog.text('testResourceMatrixMediaUpper', 'case begin', 'resource kind media with name upper');
      TestLog.step('testResourceMatrixMediaUpper', 'resource kind media with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixMediaUpper', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixMediaUpper', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixMediaUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixMediaUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixMediaUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixMediaUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixMediaUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixMediaUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixMediaUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixMediaUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixMediaUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixMediaUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixMediaUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixMediaUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixMediaUpper', 'case end', 'resource kind media with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6608
     * @tc.name      testResourceMatrixMediaDigitSuffix
     * @tc.desc      Checks that the Media resource reference with name DigitSuffix is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixMediaDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'media' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixMediaDigitSuffix', 'case begin', 'resource kind media with name digitsuffix');
      TestLog.step('testResourceMatrixMediaDigitSuffix', 'resource kind media with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixMediaDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixMediaDigitSuffix', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixMediaDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixMediaDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixMediaDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixMediaDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixMediaDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixMediaDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixMediaDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixMediaDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixMediaDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixMediaDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixMediaDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixMediaDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixMediaDigitSuffix', 'case end', 'resource kind media with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6609
     * @tc.name      testResourceMatrixMediaLeadingDigit
     * @tc.desc      Checks that the Media resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixMediaLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'media' + ':' + '1app';
      TestLog.text('testResourceMatrixMediaLeadingDigit', 'case begin', 'resource kind media with name leadingdigit');
      TestLog.step('testResourceMatrixMediaLeadingDigit', 'resource kind media with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixMediaLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixMediaLeadingDigit', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixMediaLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixMediaLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixMediaLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixMediaLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixMediaLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixMediaLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixMediaLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixMediaLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixMediaLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixMediaLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixMediaLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixMediaLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixMediaLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixMediaLeadingDigit', 'case end', 'resource kind media with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6610
     * @tc.name      testResourceMatrixMediaHyphen
     * @tc.desc      Checks that the Media resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixMediaHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'media' + ':' + 'app-name';
      TestLog.text('testResourceMatrixMediaHyphen', 'case begin', 'resource kind media with name hyphen');
      TestLog.step('testResourceMatrixMediaHyphen', 'resource kind media with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixMediaHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixMediaHyphen', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixMediaHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixMediaHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixMediaHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixMediaHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixMediaHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixMediaHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixMediaHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixMediaHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixMediaHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixMediaHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixMediaHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixMediaHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixMediaHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixMediaHyphen', 'case end', 'resource kind media with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6611
     * @tc.name      testResourceMatrixMediaEmpty
     * @tc.desc      Checks that the Media resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixMediaEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'media' + ':' + '';
      TestLog.text('testResourceMatrixMediaEmpty', 'case begin', 'resource kind media with name empty');
      TestLog.step('testResourceMatrixMediaEmpty', 'resource kind media with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixMediaEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixMediaEmpty', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixMediaEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixMediaEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixMediaEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixMediaEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixMediaEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixMediaEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixMediaEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixMediaEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixMediaEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixMediaEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixMediaEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixMediaEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixMediaEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixMediaEmpty', 'case end', 'resource kind media with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6612
     * @tc.name      testResourceMatrixColorSample
     * @tc.desc      Checks that the Color resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixColorSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'color' + ':' + 'app_name';
      TestLog.text('testResourceMatrixColorSample', 'case begin', 'resource kind color with name sample');
      TestLog.step('testResourceMatrixColorSample', 'resource kind color with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixColorSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixColorSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixColorSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixColorSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();