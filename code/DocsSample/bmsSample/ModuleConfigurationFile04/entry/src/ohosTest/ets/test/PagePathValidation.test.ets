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