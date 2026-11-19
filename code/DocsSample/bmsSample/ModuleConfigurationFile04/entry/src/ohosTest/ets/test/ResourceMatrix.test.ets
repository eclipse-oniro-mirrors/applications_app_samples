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
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixColorSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixColorSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixColorSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixColorSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixColorSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixColorSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixColorSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixColorSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixColorSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixColorSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixColorSample', 'case end', 'resource kind color with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6613
     * @tc.name      testResourceMatrixColorUpper
     * @tc.desc      Checks that the Color resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixColorUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'color' + ':' + 'AppName';
      TestLog.text('testResourceMatrixColorUpper', 'case begin', 'resource kind color with name upper');
      TestLog.step('testResourceMatrixColorUpper', 'resource kind color with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixColorUpper', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixColorUpper', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixColorUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixColorUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixColorUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixColorUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixColorUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixColorUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixColorUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixColorUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixColorUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixColorUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixColorUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixColorUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixColorUpper', 'case end', 'resource kind color with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6614
     * @tc.name      testResourceMatrixColorDigitSuffix
     * @tc.desc      Checks that the Color resource reference with name DigitSuffix is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixColorDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'color' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixColorDigitSuffix', 'case begin', 'resource kind color with name digitsuffix');
      TestLog.step('testResourceMatrixColorDigitSuffix', 'resource kind color with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixColorDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixColorDigitSuffix', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixColorDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixColorDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixColorDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixColorDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixColorDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixColorDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixColorDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixColorDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixColorDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixColorDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixColorDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixColorDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixColorDigitSuffix', 'case end', 'resource kind color with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6615
     * @tc.name      testResourceMatrixColorLeadingDigit
     * @tc.desc      Checks that the Color resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixColorLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'color' + ':' + '1app';
      TestLog.text('testResourceMatrixColorLeadingDigit', 'case begin', 'resource kind color with name leadingdigit');
      TestLog.step('testResourceMatrixColorLeadingDigit', 'resource kind color with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixColorLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixColorLeadingDigit', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixColorLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixColorLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixColorLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixColorLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixColorLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixColorLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixColorLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixColorLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixColorLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixColorLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixColorLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixColorLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixColorLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixColorLeadingDigit', 'case end', 'resource kind color with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6616
     * @tc.name      testResourceMatrixColorHyphen
     * @tc.desc      Checks that the Color resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixColorHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'color' + ':' + 'app-name';
      TestLog.text('testResourceMatrixColorHyphen', 'case begin', 'resource kind color with name hyphen');
      TestLog.step('testResourceMatrixColorHyphen', 'resource kind color with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixColorHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixColorHyphen', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixColorHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixColorHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixColorHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixColorHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixColorHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixColorHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixColorHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixColorHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixColorHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixColorHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixColorHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixColorHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixColorHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixColorHyphen', 'case end', 'resource kind color with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6617
     * @tc.name      testResourceMatrixColorEmpty
     * @tc.desc      Checks that the Color resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixColorEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'color' + ':' + '';
      TestLog.text('testResourceMatrixColorEmpty', 'case begin', 'resource kind color with name empty');
      TestLog.step('testResourceMatrixColorEmpty', 'resource kind color with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixColorEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixColorEmpty', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixColorEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixColorEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixColorEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixColorEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixColorEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixColorEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixColorEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixColorEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixColorEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixColorEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixColorEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixColorEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixColorEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixColorEmpty', 'case end', 'resource kind color with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6618
     * @tc.name      testResourceMatrixProfileSample
     * @tc.desc      Checks that the Profile resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixProfileSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'profile' + ':' + 'app_name';
      TestLog.text('testResourceMatrixProfileSample', 'case begin', 'resource kind profile with name sample');
      TestLog.step('testResourceMatrixProfileSample', 'resource kind profile with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixProfileSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixProfileSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixProfileSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixProfileSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixProfileSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixProfileSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixProfileSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixProfileSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixProfileSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixProfileSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixProfileSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixProfileSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixProfileSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixProfileSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixProfileSample', 'case end', 'resource kind profile with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6619
     * @tc.name      testResourceMatrixProfileUpper
     * @tc.desc      Checks that the Profile resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixProfileUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'profile' + ':' + 'AppName';
      TestLog.text('testResourceMatrixProfileUpper', 'case begin', 'resource kind profile with name upper');
      TestLog.step('testResourceMatrixProfileUpper', 'resource kind profile with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixProfileUpper', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixProfileUpper', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixProfileUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixProfileUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixProfileUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixProfileUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixProfileUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixProfileUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixProfileUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixProfileUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixProfileUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixProfileUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixProfileUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixProfileUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixProfileUpper', 'case end', 'resource kind profile with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6620
     * @tc.name      testResourceMatrixProfileDigitSuffix
     * @tc.desc      Checks that the Profile resource reference with name DigitSuffix is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixProfileDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'profile' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixProfileDigitSuffix', 'case begin', 'resource kind profile with name digitsuffix');
      TestLog.step('testResourceMatrixProfileDigitSuffix', 'resource kind profile with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixProfileDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixProfileDigitSuffix', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixProfileDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixProfileDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixProfileDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixProfileDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixProfileDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixProfileDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixProfileDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixProfileDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixProfileDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixProfileDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixProfileDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixProfileDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixProfileDigitSuffix', 'case end', 'resource kind profile with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6621
     * @tc.name      testResourceMatrixProfileLeadingDigit
     * @tc.desc      Checks that the Profile resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixProfileLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'profile' + ':' + '1app';
      TestLog.text('testResourceMatrixProfileLeadingDigit', 
        'case begin', 'resource kind profile with name leadingdigit');
      TestLog.step('testResourceMatrixProfileLeadingDigit', 'resource kind profile with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixProfileLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixProfileLeadingDigit', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixProfileLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixProfileLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixProfileLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixProfileLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixProfileLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixProfileLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixProfileLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixProfileLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixProfileLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixProfileLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixProfileLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixProfileLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixProfileLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixProfileLeadingDigit', 'case end', 'resource kind profile with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6622
     * @tc.name      testResourceMatrixProfileHyphen
     * @tc.desc      Checks that the Profile resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixProfileHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'profile' + ':' + 'app-name';
      TestLog.text('testResourceMatrixProfileHyphen', 'case begin', 'resource kind profile with name hyphen');
      TestLog.step('testResourceMatrixProfileHyphen', 'resource kind profile with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixProfileHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixProfileHyphen', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixProfileHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixProfileHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixProfileHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixProfileHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixProfileHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixProfileHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixProfileHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixProfileHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixProfileHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixProfileHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixProfileHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixProfileHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixProfileHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixProfileHyphen', 'case end', 'resource kind profile with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6623
     * @tc.name      testResourceMatrixProfileEmpty
     * @tc.desc      Checks that the Profile resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixProfileEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'profile' + ':' + '';
      TestLog.text('testResourceMatrixProfileEmpty', 'case begin', 'resource kind profile with name empty');
      TestLog.step('testResourceMatrixProfileEmpty', 'resource kind profile with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixProfileEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixProfileEmpty', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixProfileEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixProfileEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixProfileEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixProfileEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixProfileEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixProfileEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixProfileEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixProfileEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixProfileEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixProfileEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixProfileEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixProfileEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixProfileEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixProfileEmpty', 'case end', 'resource kind profile with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6624
     * @tc.name      testResourceMatrixFloatSample
     * @tc.desc      Checks that the Float resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixFloatSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'float' + ':' + 'app_name';
      TestLog.text('testResourceMatrixFloatSample', 'case begin', 'resource kind float with name sample');
      TestLog.step('testResourceMatrixFloatSample', 'resource kind float with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixFloatSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixFloatSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixFloatSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixFloatSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixFloatSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixFloatSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixFloatSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixFloatSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixFloatSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixFloatSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixFloatSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixFloatSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixFloatSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixFloatSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixFloatSample', 'case end', 'resource kind float with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6625
     * @tc.name      testResourceMatrixFloatUpper
     * @tc.desc      Checks that the Float resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixFloatUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'float' + ':' + 'AppName';
      TestLog.text('testResourceMatrixFloatUpper', 'case begin', 'resource kind float with name upper');
      TestLog.step('testResourceMatrixFloatUpper', 'resource kind float with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixFloatUpper', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixFloatUpper', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixFloatUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixFloatUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixFloatUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixFloatUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixFloatUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixFloatUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixFloatUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixFloatUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixFloatUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixFloatUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixFloatUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixFloatUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixFloatUpper', 'case end', 'resource kind float with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6626
     * @tc.name      testResourceMatrixFloatDigitSuffix
     * @tc.desc      Checks that the Float resource reference with name DigitSuffix is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixFloatDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'float' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixFloatDigitSuffix', 'case begin', 'resource kind float with name digitsuffix');
      TestLog.step('testResourceMatrixFloatDigitSuffix', 'resource kind float with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixFloatDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixFloatDigitSuffix', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixFloatDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixFloatDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixFloatDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixFloatDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixFloatDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixFloatDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixFloatDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixFloatDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixFloatDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixFloatDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixFloatDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixFloatDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixFloatDigitSuffix', 'case end', 'resource kind float with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6627
     * @tc.name      testResourceMatrixFloatLeadingDigit
     * @tc.desc      Checks that the Float resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixFloatLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'float' + ':' + '1app';
      TestLog.text('testResourceMatrixFloatLeadingDigit', 'case begin', 'resource kind float with name leadingdigit');
      TestLog.step('testResourceMatrixFloatLeadingDigit', 'resource kind float with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixFloatLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixFloatLeadingDigit', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixFloatLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixFloatLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixFloatLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixFloatLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixFloatLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixFloatLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixFloatLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixFloatLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixFloatLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixFloatLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixFloatLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixFloatLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixFloatLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixFloatLeadingDigit', 'case end', 'resource kind float with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6628
     * @tc.name      testResourceMatrixFloatHyphen
     * @tc.desc      Checks that the Float resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixFloatHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'float' + ':' + 'app-name';
      TestLog.text('testResourceMatrixFloatHyphen', 'case begin', 'resource kind float with name hyphen');
      TestLog.step('testResourceMatrixFloatHyphen', 'resource kind float with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixFloatHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixFloatHyphen', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixFloatHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixFloatHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixFloatHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixFloatHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixFloatHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixFloatHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixFloatHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixFloatHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixFloatHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixFloatHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixFloatHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixFloatHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixFloatHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixFloatHyphen', 'case end', 'resource kind float with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6629
     * @tc.name      testResourceMatrixFloatEmpty
     * @tc.desc      Checks that the Float resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixFloatEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'float' + ':' + '';
      TestLog.text('testResourceMatrixFloatEmpty', 'case begin', 'resource kind float with name empty');
      TestLog.step('testResourceMatrixFloatEmpty', 'resource kind float with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixFloatEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixFloatEmpty', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixFloatEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixFloatEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixFloatEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixFloatEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixFloatEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixFloatEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixFloatEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixFloatEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixFloatEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixFloatEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixFloatEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixFloatEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixFloatEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixFloatEmpty', 'case end', 'resource kind float with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6630
     * @tc.name      testResourceMatrixPluralSample
     * @tc.desc      Checks that the Plural resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixPluralSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'plural' + ':' + 'app_name';
      TestLog.text('testResourceMatrixPluralSample', 'case begin', 'resource kind plural with name sample');
      TestLog.step('testResourceMatrixPluralSample', 'resource kind plural with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixPluralSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixPluralSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixPluralSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixPluralSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixPluralSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixPluralSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixPluralSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixPluralSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixPluralSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixPluralSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixPluralSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixPluralSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixPluralSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixPluralSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixPluralSample', 'case end', 'resource kind plural with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6631
     * @tc.name      testResourceMatrixPluralUpper
     * @tc.desc      Checks that the Plural resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixPluralUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'plural' + ':' + 'AppName';
      TestLog.text('testResourceMatrixPluralUpper', 'case begin', 'resource kind plural with name upper');
      TestLog.step('testResourceMatrixPluralUpper', 'resource kind plural with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixPluralUpper', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixPluralUpper', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixPluralUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixPluralUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixPluralUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixPluralUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixPluralUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixPluralUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixPluralUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixPluralUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixPluralUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixPluralUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixPluralUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixPluralUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixPluralUpper', 'case end', 'resource kind plural with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6632
     * @tc.name      testResourceMatrixPluralDigitSuffix
     * @tc.desc      Checks that the Plural resource reference with name DigitSuffix is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixPluralDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'plural' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixPluralDigitSuffix', 'case begin', 'resource kind plural with name digitsuffix');
      TestLog.step('testResourceMatrixPluralDigitSuffix', 'resource kind plural with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixPluralDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixPluralDigitSuffix', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixPluralDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixPluralDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixPluralDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixPluralDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixPluralDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixPluralDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixPluralDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixPluralDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixPluralDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixPluralDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixPluralDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixPluralDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixPluralDigitSuffix', 'case end', 'resource kind plural with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6633
     * @tc.name      testResourceMatrixPluralLeadingDigit
     * @tc.desc      Checks that the Plural resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixPluralLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'plural' + ':' + '1app';
      TestLog.text('testResourceMatrixPluralLeadingDigit', 'case begin', 'resource kind plural with name leadingdigit');
      TestLog.step('testResourceMatrixPluralLeadingDigit', 'resource kind plural with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixPluralLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixPluralLeadingDigit', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixPluralLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixPluralLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixPluralLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixPluralLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixPluralLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixPluralLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixPluralLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixPluralLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixPluralLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixPluralLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixPluralLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixPluralLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixPluralLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixPluralLeadingDigit', 'case end', 'resource kind plural with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6634
     * @tc.name      testResourceMatrixPluralHyphen
     * @tc.desc      Checks that the Plural resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixPluralHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'plural' + ':' + 'app-name';
      TestLog.text('testResourceMatrixPluralHyphen', 'case begin', 'resource kind plural with name hyphen');
      TestLog.step('testResourceMatrixPluralHyphen', 'resource kind plural with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixPluralHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixPluralHyphen', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixPluralHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixPluralHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixPluralHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixPluralHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixPluralHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixPluralHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixPluralHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixPluralHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixPluralHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixPluralHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixPluralHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixPluralHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixPluralHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixPluralHyphen', 'case end', 'resource kind plural with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6635
     * @tc.name      testResourceMatrixPluralEmpty
     * @tc.desc      Checks that the Plural resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixPluralEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'plural' + ':' + '';
      TestLog.text('testResourceMatrixPluralEmpty', 'case begin', 'resource kind plural with name empty');
      TestLog.step('testResourceMatrixPluralEmpty', 'resource kind plural with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixPluralEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixPluralEmpty', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixPluralEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixPluralEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixPluralEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixPluralEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixPluralEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixPluralEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixPluralEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixPluralEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixPluralEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixPluralEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixPluralEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixPluralEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixPluralEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixPluralEmpty', 'case end', 'resource kind plural with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6636
     * @tc.name      testResourceMatrixBooleanSample
     * @tc.desc      Checks that the Boolean resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixBooleanSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'boolean' + ':' + 'app_name';
      TestLog.text('testResourceMatrixBooleanSample', 'case begin', 'resource kind boolean with name sample');
      TestLog.step('testResourceMatrixBooleanSample', 'resource kind boolean with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixBooleanSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixBooleanSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixBooleanSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixBooleanSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixBooleanSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixBooleanSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixBooleanSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixBooleanSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixBooleanSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixBooleanSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixBooleanSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixBooleanSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixBooleanSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixBooleanSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixBooleanSample', 'case end', 'resource kind boolean with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6637
     * @tc.name      testResourceMatrixBooleanUpper
     * @tc.desc      Checks that the Boolean resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixBooleanUpper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'boolean' + ':' + 'AppName';
      TestLog.text('testResourceMatrixBooleanUpper', 'case begin', 'resource kind boolean with name upper');
      TestLog.step('testResourceMatrixBooleanUpper', 'resource kind boolean with name upper');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixBooleanUpper', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixBooleanUpper', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixBooleanUpper', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixBooleanUpper', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixBooleanUpper', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixBooleanUpper', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixBooleanUpper', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixBooleanUpper', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixBooleanUpper', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixBooleanUpper', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixBooleanUpper', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixBooleanUpper', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixBooleanUpper', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixBooleanUpper', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixBooleanUpper', 'case end', 'resource kind boolean with name upper');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6638
     * @tc.name      testResourceMatrixBooleanDigitSuffix
     * @tc.desc      Checks that the Boolean resource reference with name DigitSuffix is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixBooleanDigitSuffix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'boolean' + ':' + 'app_name_2';
      TestLog.text('testResourceMatrixBooleanDigitSuffix', 'case begin', 'resource kind boolean with name digitsuffix');
      TestLog.step('testResourceMatrixBooleanDigitSuffix', 'resource kind boolean with name digitsuffix');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixBooleanDigitSuffix', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixBooleanDigitSuffix', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixBooleanDigitSuffix', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixBooleanDigitSuffix', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixBooleanDigitSuffix', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixBooleanDigitSuffix', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixBooleanDigitSuffix', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixBooleanDigitSuffix', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixBooleanDigitSuffix', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixBooleanDigitSuffix', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixBooleanDigitSuffix', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixBooleanDigitSuffix', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixBooleanDigitSuffix', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixBooleanDigitSuffix', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixBooleanDigitSuffix', 'case end', 'resource kind boolean with name digitsuffix');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6639
     * @tc.name      testResourceMatrixBooleanLeadingDigit
     * @tc.desc      Checks that the Boolean resource reference with name LeadingDigit is validated as
     * @tc.desc      expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixBooleanLeadingDigit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'boolean' + ':' + '1app';
      TestLog.text('testResourceMatrixBooleanLeadingDigit', 
        'case begin', 'resource kind boolean with name leadingdigit');
      TestLog.step('testResourceMatrixBooleanLeadingDigit', 'resource kind boolean with name leadingdigit');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixBooleanLeadingDigit', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixBooleanLeadingDigit', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_LEADING_DIGIT');
      TestLog.flag('testResourceMatrixBooleanLeadingDigit', 'has code RESOURCE_REF_LEADING_DIGIT', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixBooleanLeadingDigit', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixBooleanLeadingDigit', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixBooleanLeadingDigit', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixBooleanLeadingDigit', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixBooleanLeadingDigit', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixBooleanLeadingDigit', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixBooleanLeadingDigit', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixBooleanLeadingDigit', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixBooleanLeadingDigit', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixBooleanLeadingDigit', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixBooleanLeadingDigit', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixBooleanLeadingDigit', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixBooleanLeadingDigit', 'case end', 'resource kind boolean with name leadingdigit');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6640
     * @tc.name      testResourceMatrixBooleanHyphen
     * @tc.desc      Checks that the Boolean resource reference with name Hyphen is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixBooleanHyphen',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'boolean' + ':' + 'app-name';
      TestLog.text('testResourceMatrixBooleanHyphen', 'case begin', 'resource kind boolean with name hyphen');
      TestLog.step('testResourceMatrixBooleanHyphen', 'resource kind boolean with name hyphen');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixBooleanHyphen', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixBooleanHyphen', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_ILLEGAL_NAME');
      TestLog.flag('testResourceMatrixBooleanHyphen', 'has code RESOURCE_REF_ILLEGAL_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixBooleanHyphen', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixBooleanHyphen', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixBooleanHyphen', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixBooleanHyphen', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixBooleanHyphen', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixBooleanHyphen', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixBooleanHyphen', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixBooleanHyphen', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixBooleanHyphen', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixBooleanHyphen', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixBooleanHyphen', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixBooleanHyphen', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixBooleanHyphen', 'case end', 'resource kind boolean with name hyphen');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6641
     * @tc.name      testResourceMatrixBooleanEmpty
     * @tc.desc      Checks that the Boolean resource reference with name Empty is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixBooleanEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'boolean' + ':' + '';
      TestLog.text('testResourceMatrixBooleanEmpty', 'case begin', 'resource kind boolean with name empty');
      TestLog.step('testResourceMatrixBooleanEmpty', 'resource kind boolean with name empty');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixBooleanEmpty', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixBooleanEmpty', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_EMPTY_NAME');
      TestLog.flag('testResourceMatrixBooleanEmpty', 'has code RESOURCE_REF_EMPTY_NAME', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixBooleanEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixBooleanEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixBooleanEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixBooleanEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixBooleanEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixBooleanEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixBooleanEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixBooleanEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixBooleanEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixBooleanEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixBooleanEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixBooleanEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixBooleanEmpty', 'case end', 'resource kind boolean with name empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6642
     * @tc.name      testResourceMatrixIntegerSample
     * @tc.desc      Checks that the Integer resource reference with name Sample is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testResourceMatrixIntegerSample',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const reference: string = '$' + 'integer' + ':' + 'app_name';
      TestLog.text('testResourceMatrixIntegerSample', 'case begin', 'resource kind integer with name sample');
      TestLog.step('testResourceMatrixIntegerSample', 'resource kind integer with name sample');
      const findings: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.findings('testResourceMatrixIntegerSample', 'matrix findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'RESOURCE_REF_KIND_MISMATCH');
      TestLog.flag('testResourceMatrixIntegerSample', 'has code RESOURCE_REF_KIND_MISMATCH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testResourceMatrixIntegerSample', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testResourceMatrixIntegerSample', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testResourceMatrixIntegerSample', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testResourceMatrixIntegerSample', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testResourceMatrixIntegerSample', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testResourceMatrixIntegerSample', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testResourceMatrixIntegerSample', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testResourceMatrixIntegerSample', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testResourceMatrixIntegerSample', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testResourceMatrixIntegerSample', 'first signature', firstSignature);
      const repeat: Finding[] = ResourceReference.validate(reference, 'string', 'app.label');
      TestLog.number('testResourceMatrixIntegerSample', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testResourceMatrixIntegerSample', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testResourceMatrixIntegerSample', 'case end', 'resource kind integer with name sample');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_6643
     * @tc.name      testResourceMatrixIntegerUpper
     * @tc.desc      Checks that the Integer resource reference with name Upper is validated as expected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0