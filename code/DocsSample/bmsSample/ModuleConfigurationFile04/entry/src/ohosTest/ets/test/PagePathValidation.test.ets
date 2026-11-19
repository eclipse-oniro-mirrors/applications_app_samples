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
import { PagePathValidator } from '../harness/PagePathValidator';
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
export default function PagePathValidationTest(): void {
  describe('PagePathValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4300
     * @tc.name      testPageListSinglePage
     * @tc.desc      Checks that the a single page path under the pages directory is accepted by the page
     * @tc.desc      list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListSinglePage',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/Index'];
      TestLog.text('testPageListSinglePage', 'case begin', 'page list input singlepage');
      TestLog.step('testPageListSinglePage', 'page list input singlepage');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListSinglePage', 'page list', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPageListSinglePage', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListSinglePage', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListSinglePage', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListSinglePage', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListSinglePage', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListSinglePage', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListSinglePage', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListSinglePage', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListSinglePage', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListSinglePage', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListSinglePage', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListSinglePage', 'case end', 'page list input singlepage');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4301
     * @tc.name      testPageListLowerCasePage
     * @tc.desc      Checks that the a lower case page path is accepted by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListLowerCasePage',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/index'];
      TestLog.text('testPageListLowerCasePage', 'case begin', 'page list input lowercasepage');
      TestLog.step('testPageListLowerCasePage', 'page list input lowercasepage');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListLowerCasePage', 'page list', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPageListLowerCasePage', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListLowerCasePage', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListLowerCasePage', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListLowerCasePage', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListLowerCasePage', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListLowerCasePage', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListLowerCasePage', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListLowerCasePage', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListLowerCasePage', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListLowerCasePage', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListLowerCasePage', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListLowerCasePage', 'case end', 'page list input lowercasepage');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4302
     * @tc.name      testPageListTwoPages
     * @tc.desc      Checks that the two distinct page paths is accepted by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListTwoPages',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/Index', 'pages/Detail'];
      TestLog.text('testPageListTwoPages', 'case begin', 'page list input twopages');
      TestLog.step('testPageListTwoPages', 'page list input twopages');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListTwoPages', 'page list', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPageListTwoPages', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListTwoPages', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListTwoPages', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListTwoPages', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListTwoPages', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListTwoPages', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListTwoPages', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListTwoPages', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListTwoPages', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListTwoPages', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListTwoPages', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListTwoPages', 'case end', 'page list input twopages');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4303
     * @tc.name      testPageListNestedPage
     * @tc.desc      Checks that the a nested page path is accepted by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListNestedPage',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/Index', 'pages/detail/Item'];
      TestLog.text('testPageListNestedPage', 'case begin', 'page list input nestedpage');
      TestLog.step('testPageListNestedPage', 'page list input nestedpage');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListNestedPage', 'page list', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPageListNestedPage', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListNestedPage', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListNestedPage', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListNestedPage', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListNestedPage', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListNestedPage', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListNestedPage', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListNestedPage', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListNestedPage', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListNestedPage', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListNestedPage', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListNestedPage', 'case end', 'page list input nestedpage');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4304
     * @tc.name      testPageListEmpty
     * @tc.desc      Checks that the an empty page list is reported with PAGES_LIST_EMPTY by the page list
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = [];
      TestLog.text('testPageListEmpty', 'case begin', 'page list input empty');
      TestLog.step('testPageListEmpty', 'page list input empty');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListEmpty', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_EMPTY');
      TestLog.flag('testPageListEmpty', 'has code PAGES_LIST_EMPTY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListEmpty', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListEmpty', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListEmpty', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListEmpty', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListEmpty', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListEmpty', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListEmpty', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListEmpty', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListEmpty', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListEmpty', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListEmpty', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListEmpty', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListEmpty', 'case end', 'page list input empty');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4305
     * @tc.name      testPageListDuplicate
     * @tc.desc      Checks that the a duplicated page path is reported with PAGES_LIST_DUPLICATE by the page
     * @tc.desc      list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListDuplicate',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/Index', 'pages/Index'];
      TestLog.text('testPageListDuplicate', 'case begin', 'page list input duplicate');
      TestLog.step('testPageListDuplicate', 'page list input duplicate');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListDuplicate', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_DUPLICATE');
      TestLog.flag('testPageListDuplicate', 'has code PAGES_LIST_DUPLICATE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListDuplicate', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListDuplicate', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListDuplicate', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListDuplicate', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListDuplicate', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListDuplicate', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListDuplicate', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListDuplicate', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListDuplicate', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListDuplicate', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListDuplicate', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListDuplicate', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListDuplicate', 'case end', 'page list input duplicate');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4306
     * @tc.name      testPageListBlank
     * @tc.desc      Checks that the a blank page path is reported with PAGES_LIST_BLANK by the page list
     * @tc.desc      rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListBlank',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = [''];
      TestLog.text('testPageListBlank', 'case begin', 'page list input blank');
      TestLog.step('testPageListBlank', 'page list input blank');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListBlank', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_BLANK');
      TestLog.flag('testPageListBlank', 'has code PAGES_LIST_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListBlank', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListBlank', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListBlank', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListBlank', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListBlank', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListBlank', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListBlank', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListBlank', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListBlank', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListBlank', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListBlank', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListBlank', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListBlank', 'case end', 'page list input blank');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4307
     * @tc.name      testPageListSpaces
     * @tc.desc      Checks that the a whitespace page path is reported with PAGES_LIST_BLANK by the page
     * @tc.desc      list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListSpaces',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['   '];
      TestLog.text('testPageListSpaces', 'case begin', 'page list input spaces');
      TestLog.step('testPageListSpaces', 'page list input spaces');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListSpaces', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_BLANK');
      TestLog.flag('testPageListSpaces', 'has code PAGES_LIST_BLANK', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListSpaces', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListSpaces', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListSpaces', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListSpaces', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListSpaces', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListSpaces', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListSpaces', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListSpaces', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListSpaces', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListSpaces', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListSpaces', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListSpaces', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListSpaces', 'case end', 'page list input spaces');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4308
     * @tc.name      testPageListWhitespace
     * @tc.desc      Checks that the a page path with whitespace is reported with PAGES_LIST_WHITESPACE by
     * @tc.desc      the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListWhitespace',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/ Index'];
      TestLog.text('testPageListWhitespace', 'case begin', 'page list input whitespace');
      TestLog.step('testPageListWhitespace', 'page list input whitespace');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListWhitespace', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_WHITESPACE');
      TestLog.flag('testPageListWhitespace', 'has code PAGES_LIST_WHITESPACE', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListWhitespace', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListWhitespace', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListWhitespace', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListWhitespace', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListWhitespace', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListWhitespace', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListWhitespace', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListWhitespace', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListWhitespace', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListWhitespace', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListWhitespace', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListWhitespace', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListWhitespace', 'case end', 'page list input whitespace');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4309
     * @tc.name      testPageListTraversal
     * @tc.desc      Checks that the a page path with parent traversal is reported with PAGES_LIST_TRAVERSAL
     * @tc.desc      by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListTraversal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/../Index'];
      TestLog.text('testPageListTraversal', 'case begin', 'page list input traversal');
      TestLog.step('testPageListTraversal', 'page list input traversal');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListTraversal', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_TRAVERSAL');
      TestLog.flag('testPageListTraversal', 'has code PAGES_LIST_TRAVERSAL', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListTraversal', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListTraversal', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListTraversal', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListTraversal', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListTraversal', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListTraversal', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListTraversal', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListTraversal', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListTraversal', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListTraversal', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListTraversal', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListTraversal', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListTraversal', 'case end', 'page list input traversal');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4310
     * @tc.name      testPageListBackslash
     * @tc.desc      Checks that the a page path with a backslash is reported with PAGES_LIST_BACKSLASH by
     * @tc.desc      the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListBackslash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages\\Index'];
      TestLog.text('testPageListBackslash', 'case begin', 'page list input backslash');
      TestLog.step('testPageListBackslash', 'page list input backslash');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListBackslash', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_BACKSLASH');
      TestLog.flag('testPageListBackslash', 'has code PAGES_LIST_BACKSLASH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListBackslash', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListBackslash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListBackslash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListBackslash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListBackslash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListBackslash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListBackslash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListBackslash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListBackslash', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListBackslash', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListBackslash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListBackslash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListBackslash', 'case end', 'page list input backslash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4311
     * @tc.name      testPageListLeadingSlash
     * @tc.desc      Checks that the an absolute page path is reported with PAGES_LIST_LEADING_SLASH by the
     * @tc.desc      page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListLeadingSlash',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['/pages/Index'];
      TestLog.text('testPageListLeadingSlash', 'case begin', 'page list input leadingslash');
      TestLog.step('testPageListLeadingSlash', 'page list input leadingslash');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListLeadingSlash', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_LEADING_SLASH');
      TestLog.flag('testPageListLeadingSlash', 'has code PAGES_LIST_LEADING_SLASH', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListLeadingSlash', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListLeadingSlash', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListLeadingSlash', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListLeadingSlash', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListLeadingSlash', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListLeadingSlash', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListLeadingSlash', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListLeadingSlash', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListLeadingSlash', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListLeadingSlash', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListLeadingSlash', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListLeadingSlash', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListLeadingSlash', 'case end', 'page list input leadingslash');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4312
     * @tc.name      testPageListOutsidePagesDir
     * @tc.desc      Checks that the a page path outside the pages directory is reported with
     * @tc.desc      PAGES_LIST_DIR_PREFIX by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListOutsidePagesDir',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['Index'];
      TestLog.text('testPageListOutsidePagesDir', 'case begin', 'page list input outsidepagesdir');
      TestLog.step('testPageListOutsidePagesDir', 'page list input outsidepagesdir');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListOutsidePagesDir', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_DIR_PREFIX');
      TestLog.flag('testPageListOutsidePagesDir', 'has code PAGES_LIST_DIR_PREFIX', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListOutsidePagesDir', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListOutsidePagesDir', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListOutsidePagesDir', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListOutsidePagesDir', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListOutsidePagesDir', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListOutsidePagesDir', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListOutsidePagesDir', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListOutsidePagesDir', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListOutsidePagesDir', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListOutsidePagesDir', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListOutsidePagesDir', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListOutsidePagesDir', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListOutsidePagesDir', 'case end', 'page list input outsidepagesdir');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4313
     * @tc.name      testPageListWithExtension
     * @tc.desc      Checks that the a page path with the source extension is reported with
     * @tc.desc      PAGES_LIST_EXTENSION by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListWithExtension',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/Index.ets'];
      TestLog.text('testPageListWithExtension', 'case begin', 'page list input withextension');
      TestLog.step('testPageListWithExtension', 'page list input withextension');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListWithExtension', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_EXTENSION');
      TestLog.flag('testPageListWithExtension', 'has code PAGES_LIST_EXTENSION', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListWithExtension', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListWithExtension', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListWithExtension', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListWithExtension', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListWithExtension', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListWithExtension', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListWithExtension', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListWithExtension', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListWithExtension', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListWithExtension', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListWithExtension', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListWithExtension', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListWithExtension', 'case end', 'page list input withextension');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4314
     * @tc.name      testPageListDuplicateWithExtension
     * @tc.desc      Checks that the a duplicated page path with extensions is reported with
     * @tc.desc      PAGES_LIST_DUPLICATE, PAGES_LIST_EXTENSION by the page list rule.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageListDuplicateWithExtension',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = ['pages/Index.ets', 'pages/Index.ets'];
      TestLog.text('testPageListDuplicateWithExtension', 'case begin', 'page list input duplicatewithextension');
      TestLog.step('testPageListDuplicateWithExtension', 'page list input duplicatewithextension');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPageListDuplicateWithExtension', 'page list', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected1: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_DUPLICATE');
      TestLog.flag('testPageListDuplicateWithExtension', 'has code PAGES_LIST_DUPLICATE', hasExpected1);
      expect(hasExpected1).assertTrue();
      const hasExpected2: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_EXTENSION');
      TestLog.flag('testPageListDuplicateWithExtension', 'has code PAGES_LIST_EXTENSION', hasExpected2);
      expect(hasExpected2).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPageListDuplicateWithExtension', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPageListDuplicateWithExtension', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPageListDuplicateWithExtension', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPageListDuplicateWithExtension', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPageListDuplicateWithExtension', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPageListDuplicateWithExtension', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPageListDuplicateWithExtension', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPageListDuplicateWithExtension', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPageListDuplicateWithExtension', 'highest severity', highest);
      expect(highest).assertEqual(Severity.ERROR);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPageListDuplicateWithExtension', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPageListDuplicateWithExtension', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPageListDuplicateWithExtension', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPageListDuplicateWithExtension', 'case end', 'page list input duplicatewithextension');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4340
     * @tc.name      testPagePathTooMany
     * @tc.desc      Checks that more than one hundred page paths are warned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathTooMany',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = [];
      for (let index: number = 0; index < 101; index++) {
        pages.push(`pages/Page${index}`);
      }
      TestLog.text('testPagePathTooMany', 'case begin', 'page list size check');
      TestLog.step('testPagePathTooMany', 'page list size check');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPagePathTooMany', 'page path findings', findings);
      expect(findings.length > 0).assertTrue();
      const hasExpected: boolean = FindingUtils.hasCode(findings, 'PAGES_LIST_TOO_MANY');
      TestLog.flag('testPagePathTooMany', 'has code PAGES_LIST_TOO_MANY', hasExpected);
      expect(hasExpected).assertTrue();
      const wellFormed: boolean = FindingUtils.allWellFormed(findings);
      TestLog.flag('testPagePathTooMany', 'findings well formed', wellFormed);
      expect(wellFormed).assertTrue();
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPagePathTooMany', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPagePathTooMany', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPagePathTooMany', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPagePathTooMany', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPagePathTooMany', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPagePathTooMany', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPagePathTooMany', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const highest: Severity = FindingUtils.maxSeverity(findings);
      TestLog.number('testPagePathTooMany', 'highest severity', highest);
      expect(highest).assertEqual(Severity.WARN);
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPagePathTooMany', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPagePathTooMany', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPagePathTooMany', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPagePathTooMany', 'case end', 'page list size check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4341
     * @tc.name      testPagePathMaximumValid
     * @tc.desc      Checks that one hundred distinct page paths pass validation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathMaximumValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const pages: string[] = [];
      for (let index: number = 0; index < 100; index++) {
        pages.push(`pages/Page${index}`);
      }
      TestLog.text('testPagePathMaximumValid', 'case begin', 'page list boundary check');
      TestLog.step('testPagePathMaximumValid', 'page list boundary check');
      const findings: Finding[] = PagePathValidator.validate(pages);
      TestLog.findings('testPagePathMaximumValid', 'page path findings', findings);
      expect(findings.length).assertEqual(0);
      const errorCount: number = FindingUtils.filterBySeverity(findings, Severity.ERROR).length;
      TestLog.number('testPagePathMaximumValid', 'error count', errorCount);
      expect(errorCount).assertEqual(0);
      if (findings.length > 0) {
        const firstPath: string = findings[0].path;
        TestLog.text('testPagePathMaximumValid', 'first finding path', firstPath);
        expect(firstPath.length > 0).assertTrue();
        const paths: string[] = FindingUtils.paths(findings);
        for (let pathIndex: number = 0; pathIndex < paths.length; pathIndex++) {
          TestLog.text('testPagePathMaximumValid', 'finding path', paths[pathIndex]);
          expect(paths[pathIndex].length > 0).assertTrue();
        }
      }
      const report: FindingReport = new FindingReport(findings);
      TestLog.text('testPagePathMaximumValid', 'report summary', report.summary());
      const reportCount: number = report.count();
      TestLog.number('testPagePathMaximumValid', 'report count', reportCount);
      expect(reportCount).assertEqual(findings.length);
      const severityTotal: number =
        report.errorCount() + report.warningCount() + report.infoCount();
      TestLog.number('testPagePathMaximumValid', 'severity total', severityTotal);
      expect(severityTotal).assertEqual(findings.length);
      const ordered: boolean = report.isSeverityOrdered();
      TestLog.flag('testPagePathMaximumValid', 'severity ordered', ordered);
      expect(ordered).assertTrue();
      const reportWellFormed: boolean = report.allWellFormed();
      TestLog.flag('testPagePathMaximumValid', 'report well formed', reportWellFormed);
      expect(reportWellFormed).assertTrue();
      const firstSignature: string = FindingUtils.signatureList(findings);
      TestLog.text('testPagePathMaximumValid', 'first signature', firstSignature);
      const repeat: Finding[] = PagePathValidator.validate(pages);
      TestLog.number('testPagePathMaximumValid', 'repeat count', repeat.length);
      expect(repeat.length).assertEqual(findings.length);
      const repeatSignature: string = FindingUtils.signatureList(repeat);
      TestLog.text('testPagePathMaximumValid', 'repeat signature', repeatSignature);
      expect(repeatSignature).assertEqual(firstSignature);
      TestLog.text('testPagePathMaximumValid', 'case end', 'page list boundary check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4342
     * @tc.name      testPagePathContainsPage
     * @tc.desc      Checks that a declared page is found.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathContainsPage',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathContainsPage', 'case begin', 'containspage page path check');
      TestLog.step('testPagePathContainsPage', 'containspage page path check');
      const actual: boolean = PagePathValidator.containsPage(['pages/Index', 'pages/Detail'], 'pages/Detail');
      TestLog.text('testPagePathContainsPage', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testPagePathContainsPage', 'case end', 'containspage page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4343
     * @tc.name      testPagePathContainsMissingPage
     * @tc.desc      Checks that a missing page is not found.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathContainsMissingPage',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathContainsMissingPage', 'case begin', 'containsmissingpage page path check');
      TestLog.step('testPagePathContainsMissingPage', 'containsmissingpage page path check');
      const actual: boolean = PagePathValidator.containsPage(['pages/Index'], 'pages/Detail');
      TestLog.text('testPagePathContainsMissingPage', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testPagePathContainsMissingPage', 'case end', 'containsmissingpage page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4344
     * @tc.name      testPagePathDuplicatesCount
     * @tc.desc      Checks that one duplicated page is detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathDuplicatesCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathDuplicatesCount', 'case begin', 'duplicatescount page path check');
      TestLog.step('testPagePathDuplicatesCount', 'duplicatescount page path check');
      const actual: number = PagePathValidator.duplicates(['pages/Index', 'pages/Index', 'pages/Detail']).length;
      TestLog.text('testPagePathDuplicatesCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testPagePathDuplicatesCount', 'case end', 'duplicatescount page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4345
     * @tc.name      testPagePathDuplicatesNone
     * @tc.desc      Checks that distinct pages have no duplicates.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathDuplicatesNone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathDuplicatesNone', 'case begin', 'duplicatesnone page path check');
      TestLog.step('testPagePathDuplicatesNone', 'duplicatesnone page path check');
      const actual: number = PagePathValidator.duplicates(['pages/Index', 'pages/Detail']).length;
      TestLog.text('testPagePathDuplicatesNone', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testPagePathDuplicatesNone', 'case end', 'duplicatesnone page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4346
     * @tc.name      testPagePathNormalizeExtension
     * @tc.desc      Checks that the source extension is stripped.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathNormalizeExtension',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathNormalizeExtension', 'case begin', 'normalizeextension page path check');
      TestLog.step('testPagePathNormalizeExtension', 'normalizeextension page path check');
      const actual: string = PagePathValidator.normalize(['pages/Index.ets'])[0];
      TestLog.text('testPagePathNormalizeExtension', 'actual value', String(actual));
      expect(actual).assertEqual('pages/Index');
      TestLog.text('testPagePathNormalizeExtension', 'case end', 'normalizeextension page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4347
     * @tc.name      testPagePathNormalizeTrim
     * @tc.desc      Checks that surrounding whitespace is trimmed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathNormalizeTrim',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathNormalizeTrim', 'case begin', 'normalizetrim page path check');
      TestLog.step('testPagePathNormalizeTrim', 'normalizetrim page path check');
      const actual: string = PagePathValidator.normalize([' pages/Index '])[0];
      TestLog.text('testPagePathNormalizeTrim', 'actual value', String(actual));
      expect(actual).assertEqual('pages/Index');
      TestLog.text('testPagePathNormalizeTrim', 'case end', 'normalizetrim page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4348
     * @tc.name      testPagePathOutsidePagesDirCount
     * @tc.desc      Checks that page paths outside the pages directory are collected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathOutsidePagesDirCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathOutsidePagesDirCount', 'case begin', 'outsidepagesdircount page path check');
      TestLog.step('testPagePathOutsidePagesDirCount', 'outsidepagesdircount page path check');
      const actual: number = PagePathValidator.outsidePagesDir(['Index', 'pages/Detail']).length;
      TestLog.text('testPagePathOutsidePagesDirCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testPagePathOutsidePagesDirCount', 'case end', 'outsidepagesdircount page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4349
     * @tc.name      testPagePathHasUniquePagesYes
     * @tc.desc      Checks that a distinct page list has unique pages.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathHasUniquePagesYes',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathHasUniquePagesYes', 'case begin', 'hasuniquepagesyes page path check');
      TestLog.step('testPagePathHasUniquePagesYes', 'hasuniquepagesyes page path check');
      const actual: boolean = PagePathValidator.hasUniquePages(['pages/Index', 'pages/Detail']);
      TestLog.text('testPagePathHasUniquePagesYes', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testPagePathHasUniquePagesYes', 'case end', 'hasuniquepagesyes page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4350
     * @tc.name      testPagePathHasUniquePagesNo
     * @tc.desc      Checks that a duplicated page list has no unique pages.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathHasUniquePagesNo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathHasUniquePagesNo', 'case begin', 'hasuniquepagesno page path check');
      TestLog.step('testPagePathHasUniquePagesNo', 'hasuniquepagesno page path check');
      const actual: boolean = PagePathValidator.hasUniquePages(['pages/Index', 'pages/Index']);
      TestLog.text('testPagePathHasUniquePagesNo', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testPagePathHasUniquePagesNo', 'case end', 'hasuniquepagesno page path check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4351
     * @tc.name      testPagePathValidateOneValid
     * @tc.desc      Checks that a single valid page path produces no findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPagePathValidateOneValid',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      TestLog.text('testPagePathValidateOneValid', 'case begin', 'validateonevalid page path check');
      TestLog.step('testPagePathValidateOneValid', 'validateonevalid page path check');
      const actual: number = PagePathValidator.validateOne('pages/Index', 0).length;
      TestLog.text('testPagePathValidateOneValid', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testPagePathValidateOneValid', 'case end', 'validateonevalid page path check');
    })

  })
}
