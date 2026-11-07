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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import {
  TestReportGenerator,
  TestCaseReportEntry,
  FullTestReport,
  SuiteReportSection
} from '../../../main/ets/util/TestReportGenerator';

export default function testReportGeneratorTest(): void {
  describe('TestReportGeneratorTest', (): void => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    // ==================== setReportTitle (1 用例) ====================

    /*
     * @tc.number: SUB_TRG_0100
     * @tc.name: testSetReportTitle0001
     * @tc.desc: Verify setReportTitle is reflected in generated report.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSetReportTitle0001', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.setReportTitle('My Custom Report');
      const report = gen.generateReport();
      expect(report.reportTitle).assertEqual('My Custom Report');
      expect(report.reportTitle.length).assertLarger(0);
      expect(report.generatedAt).assertLarger(0);
      done();
    });

    // ==================== addEntry (3 用例) ====================

    /*
     * @tc.number: SUB_TRG_0200
     * @tc.name: testAddEntry0002
     * @tc.desc: Verify addEntry stores entry with correct field mapping.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddEntry0002', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addEntry('id1', 'case1', 'desc1', 'suite1', 'passed',
        1000, 1500, '', 5, 5, 0, ['tag1']);
      expect(gen.getEntryCount()).assertEqual(1);
      const report = gen.generateReport();
      expect(report.caseEntries[0].caseId).assertEqual('id1');
      expect(report.caseEntries[0].caseName).assertEqual('case1');
      done();
    });

    /*
     * @tc.number: SUB_TRG_0300
     * @tc.name: testTrgAddEntry0003
     * @tc.desc: Verify addEntry calculates duration as endTime - startTime.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTrgAddEntry0003', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addEntry('id2', 'case2', 'desc2', 'suite1', 'passed',
        1000, 1300, '', 3, 3, 0, []);
      const report = gen.generateReport();
      expect(report.caseEntries[0].duration).assertEqual(300);
      expect(report.caseEntries[0].startTime).assertEqual(1000);
      expect(report.caseEntries[0].endTime).assertEqual(1300);
      done();
    });

    /*
     * @tc.number: SUB_TRG_0400
     * @tc.name: testTrgAddEntry0004
     * @tc.desc: Verify addEntry stores tags array correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTrgAddEntry0004', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      const tags: string[] = ['smoke', 'regression'];
      gen.addEntry('id3', 'case3', 'desc3', 'suite1', 'passed',
        0, 100, '', 2, 2, 0, tags);
      const report = gen.generateReport();
      expect(report.caseEntries[0].tags.length).assertEqual(2);
      expect(report.caseEntries[0].tags[0]).assertEqual('smoke');
      expect(report.caseEntries[0].tags[1]).assertEqual('regression');
      done();
    });

    // ==================== addPassedEntry (2 用例) ====================

    /*
     * @tc.number: SUB_TRG_0500
     * @tc.name: testAddPassedEntry0005
     * @tc.desc: Verify addPassedEntry creates entry with status=passed.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddPassedEntry0005', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'passCase', 'suite1', 200, 5);
      expect(gen.getEntryCount()).assertEqual(1);
      const report = gen.generateReport();
      expect(report.caseEntries[0].status).assertEqual('passed');
      expect(report.caseEntries[0].assertionCount).assertEqual(5);
      done();
    });

    /*
     * @tc.number: SUB_TRG_0600
     * @tc.name: testAddPassedEntry0006
     * @tc.desc: Verify addPassedEntry sets passedAssertions=assertionCount and failed=0.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddPassedEntry0006', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p2', 'passCase2', 'suite1', 100, 3);
      const report = gen.generateReport();
      expect(report.caseEntries[0].passedAssertions).assertEqual(3);
      expect(report.caseEntries[0].failedAssertions).assertEqual(0);
      expect(report.caseEntries[0].errorMessage).assertEqual('');
      done();
    });

    // ==================== addFailedEntry (2 用例) ====================

    /*
     * @tc.number: SUB_TRG_0700
     * @tc.name: testAddFailedEntry0007
     * @tc.desc: Verify addFailedEntry creates entry with status=failed.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddFailedEntry0007', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addFailedEntry('f1', 'failCase', 'suite1', 300, 'assertion error', 4);
      expect(gen.getEntryCount()).assertEqual(1);
      const report = gen.generateReport();
      expect(report.caseEntries[0].status).assertEqual('failed');
      expect(report.caseEntries[0].errorMessage).assertEqual('assertion error');
      done();
    });

    /*
     * @tc.number: SUB_TRG_0800
     * @tc.name: testAddFailedEntry0008
     * @tc.desc: Verify addFailedEntry sets passedAssertions=0 and failedAssertions=assertionCount.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAddFailedEntry0008', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addFailedEntry('f2', 'failCase2', 'suite1', 150, 'timeout', 6);
      const report = gen.generateReport();
      expect(report.caseEntries[0].passedAssertions).assertEqual(0);
      expect(report.caseEntries[0].failedAssertions).assertEqual(6);
      expect(report.caseEntries[0].assertionCount).assertEqual(6);
      done();
    });

    // ==================== generateReport basic (3 用例) ====================

    /*
     * @tc.number: SUB_TRG_0900
     * @tc.name: testGenerateReport0009
     * @tc.desc: Verify empty report has zero totals and default title.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0009', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      const report = gen.generateReport();
      expect(report.totalCases).assertEqual(0);
      expect(report.totalPassed).assertEqual(0);
      expect(report.totalFailed).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TRG_1000
     * @tc.name: testGenerateReport0010
     * @tc.desc: Verify report with passed and failed entries calculates totals correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0010', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      gen.addPassedEntry('p2', 'c2', 's1', 200, 4);
      gen.addFailedEntry('f1', 'c3', 's1', 50, 'err', 2);
      const report = gen.generateReport();
      expect(report.totalCases).assertEqual(3);
      expect(report.totalPassed).assertEqual(2);
      expect(report.totalFailed).assertEqual(1);
      done();
    });

    /*
     * @tc.number: SUB_TRG_1100
     * @tc.name: testGenerateReport0011
     * @tc.desc: Verify report overallPassRate is calculated correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReport0011', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      gen.addPassedEntry('p2', 'c2', 's1', 100, 3);
      gen.addPassedEntry('p3', 'c3', 's1', 100, 3);
      gen.addFailedEntry('f1', 'c4', 's1', 100, 'err', 3);
      const report = gen.generateReport();
      expect(report.overallPassRate).assertEqual(75);
      expect(report.totalSkipped).assertEqual(0);
      expect(report.totalCases).assertEqual(4);
      done();
    });

    // ==================== qualityScore / qualityGrade (3 用例) ====================

    /*
     * @tc.number: SUB_TRG_1200
     * @tc.name: testQualityScore0012
     * @tc.desc: Verify qualityScore is 0 when no cases exist.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testQualityScore0012', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      const report = gen.generateReport();
      expect(report.qualityScore).assertEqual(0);
      expect(report.qualityGrade).assertEqual('F');
      expect(report.totalCases).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TRG_1300
     * @tc.name: testQualityScore0013
     * @tc.desc: Verify qualityGrade is A for all-pass with sufficient assertions.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testQualityScore0013', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      for (let i = 0; i < 10; i++) {
        gen.addPassedEntry('id' + String(i), 'case' + String(i), 'suite1', 100, 5);
      }
      const report = gen.generateReport();
      expect(report.qualityGrade).assertEqual('A');
      expect(report.qualityScore >= 90).assertTrue();
      expect(report.overallPassRate).assertEqual(100);
      done();
    });

    /*
     * @tc.number: SUB_TRG_1400
     * @tc.name: testQualityScore0014
     * @tc.desc: Verify qualityGrade degrades with failures.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testQualityScore0014', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 5);
      for (let i = 0; i < 5; i++) {
        gen.addFailedEntry('f' + String(i), 'fc' + String(i), 's1', 100, 'err', 5);
      }
      const report = gen.generateReport();
      expect(report.totalFailed).assertEqual(5);
      expect(report.qualityScore < 90).assertTrue();
      expect(report.overallPassRate < 50).assertTrue();
      done();
    });

    // ==================== generateReport suiteSections (2 用例) ====================

    /*
     * @tc.number: SUB_TRG_1500
     * @tc.name: testGenerateReportSuiteSections0015
     * @tc.desc: Verify suiteSections groups entries by suiteName.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReportSuiteSections0015', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 'suiteA', 100, 3);
      gen.addPassedEntry('p2', 'c2', 'suiteA', 200, 4);
      gen.addFailedEntry('f1', 'c3', 'suiteB', 50, 'err', 2);
      const report = gen.generateReport();
      expect(report.totalSuites).assertEqual(2);
      expect(report.suiteSections.length).assertEqual(2);
      expect(report.suiteSections[0].suiteName).assertEqual('suiteA');
      done();
    });

    /*
     * @tc.number: SUB_TRG_1600
     * @tc.name: testGenerateReportSuiteSections0016
     * @tc.desc: Verify suiteSection passRate and counts.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateReportSuiteSections0016', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 'only', 100, 3);
      gen.addPassedEntry('p2', 'c2', 'only', 100, 3);
      gen.addFailedEntry('f1', 'c3', 'only', 100, 'err', 3);
      const report = gen.generateReport();
      const section = report.suiteSections[0];
      expect(section.totalCases).assertEqual(3);
      expect(section.passedCases).assertEqual(2);
      expect(section.failedCases).assertEqual(1);
      done();
    });

    // ==================== generateTextReport (3 用例) ====================

    /*
     * @tc.number: SUB_TRG_1700
     * @tc.name: testGenerateTextReport0017
     * @tc.desc: Verify generateTextReport contains header and summary.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateTextReport0017', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.setReportTitle('Text Report Test');
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      const text = gen.generateTextReport();
      expect(text.length).assertLarger(0);
      expect(text).assertContain('Text Report Test');
      expect(text).assertContain('End of Report');
      done();
    });

    /*
     * @tc.number: SUB_TRG_1800
     * @tc.name: testGenerateTextReport0018
     * @tc.desc: Verify text report includes failed cases section when failures exist.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateTextReport0018', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addFailedEntry('f1', 'failCase', 's1', 100, 'assertion mismatch', 3);
      const text = gen.generateTextReport();
      expect(text).assertContain('Failed Cases');
      expect(text).assertContain('failCase');
      expect(text).assertContain('assertion mismatch');
      done();
    });

    /*
     * @tc.number: SUB_TRG_1900
     * @tc.name: testGenerateTextReport0019
     * @tc.desc: Verify text report does not include failed section when no failures.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateTextReport0019', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      gen.addPassedEntry('p2', 'c2', 's1', 100, 3);
      const text = gen.generateTextReport();
      expect(text.includes('Failed Cases')).assertFalse()
      expect(text).assertContain('Pass Rate: 100%');
      expect(text).assertContain('Quality Score');
      done();
    });

    // ==================== clear / getEntryCount (2 用例) ====================

    /*
     * @tc.number: SUB_TRG_2000
     * @tc.name: testTrgClear0020
     * @tc.desc: Verify clear resets all entries.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTrgClear0020', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      gen.addPassedEntry('p2', 'c2', 's1', 100, 3);
      expect(gen.getEntryCount()).assertEqual(2);
      gen.clear();
      expect(gen.getEntryCount()).assertEqual(0);
      expect(gen.generateReport().totalCases).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_TRG_2100
     * @tc.name: testGetEntryCount0021
     * @tc.desc: Verify getEntryCount tracks additions correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetEntryCount0021', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      expect(gen.getEntryCount()).assertEqual(0);
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      expect(gen.getEntryCount()).assertEqual(1);
      gen.addFailedEntry('f1', 'c2', 's1', 100, 'err', 3);
      expect(gen.getEntryCount()).assertEqual(2);
      done();
    });

    // ==================== generateReport totalDuration (1 用例) ====================

    /*
     * @tc.number: SUB_TRG_2200
     * @tc.name: testTotalDuration0022
     * @tc.desc: Verify totalDuration is sum of all entry durations.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTotalDuration0022', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      gen.addPassedEntry('p2', 'c2', 's1', 200, 3);
      gen.addFailedEntry('f1', 'c3', 's1', 300, 'err', 3);
      const report = gen.generateReport();
      expect(report.totalDuration).assertEqual(600);
      expect(report.totalDuration).assertLarger(0);
      expect(report.suiteSections.length).assertLarger(0);
      done();
    });

    // ==================== generateReport caseEntries is a copy (1 用例) ====================

    /*
     * @tc.number: SUB_TRG_2300
     * @tc.name: testCaseEntriesCopy0023
     * @tc.desc: Verify caseEntries in report is a copy, not internal reference.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCaseEntriesCopy0023', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      const report1 = gen.generateReport();
      const report2 = gen.generateReport();
      expect(report1.caseEntries === report2.caseEntries).assertFalse();
      expect(report1.caseEntries.length).assertEqual(report2.caseEntries.length);
      expect(report1.caseEntries[0].caseId).assertEqual(report2.caseEntries[0].caseId);
      done();
    });

    // ==================== suiteSection assertionDensity (1 用例) ====================

    /*
     * @tc.number: SUB_TRG_2400
     * @tc.name: testAssertionDensity0024
     * @tc.desc: Verify assertionDensity is average assertions per case in suite.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testAssertionDensity0024', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 'mySuite', 100, 4);
      gen.addPassedEntry('p2', 'c2', 'mySuite', 100, 6);
      const report = gen.generateReport();
      const section = report.suiteSections[0];
      expect(section.assertionDensity).assertEqual(5);
      expect(section.totalCases).assertEqual(2);
      expect(section.passRate).assertEqual(100);
      done();
    });

    // ==================== generatedAtFormatted (1 用例) ====================

    /*
     * @tc.number: SUB_TRG_2500
     * @tc.name: testGeneratedAtFormatted0025
     * @tc.desc: Verify generatedAtFormatted contains date-time pattern.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGeneratedAtFormatted0025', 0, async (done: Function) => {
      const gen = new TestReportGenerator();
      gen.addPassedEntry('p1', 'c1', 's1', 100, 3);
      const report = gen.generateReport();
      expect(report.generatedAtFormatted.length).assertLarger(0);
      expect(report.generatedAt).assertLarger(-1);
      expect(report.generatedAtFormatted).assertContain('-');
      done();
    });
  });
}
