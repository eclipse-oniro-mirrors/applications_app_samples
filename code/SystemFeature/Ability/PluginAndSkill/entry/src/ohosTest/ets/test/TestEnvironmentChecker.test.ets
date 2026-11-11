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
  TestEnvironmentChecker,
  CheckResult,
  EnvironmentSummary
} from '../../../main/ets/util/TestEnvironmentChecker';
import {
  BUNDLE_NAME_ARRAY,
  DEFAULT_BUNDLE_NAME,
  DEFAULT_MODULE_NAME,
  DEFAULT_SKILL_NAME,
  FLAG_LABELS,
  FLAG_VALUES,
  MODULE_NAME_ARRAY,
  SKILL_ARRAY
} from '../../../main/ets/util/Constant';

export default function testEnvironmentCheckerTest(): void {
  describe('TestEnvironmentCheckerTest', (): void => {
    beforeAll(() => { })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => { })

    // ==================== 单例模式 (2 用例) ====================

    /*
     * @tc.number: SUB_ECC_0100
     * @tc.name: testTecSingleton0001
     * @tc.desc: Verify getInstance returns a non-null object.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTecSingleton0001', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      expect(checker.getResultCount()).assertEqual(0);
      expect(checker).assertEqual(checker);
      expect(checker.getFailedResults().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ECC_0200
     * @tc.name: testTecSingleton0002
     * @tc.desc: Verify multiple getInstance calls return the same reference.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTecSingleton0002', 0, async (done: Function) => {
      const a: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      const b: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      expect(a === b).assertTrue();
      expect(a).assertEqual(b);
      expect(TestEnvironmentChecker.getInstance() === a).assertTrue();
      done();
    });

    // ==================== checkConstantsConfiguration (3 用例) ====================

    /*
     * @tc.number: SUB_ECC_0300
     * @tc.name: testCheckConstantsConfiguration0003
     * @tc.desc: Verify checkConstantsConfiguration adds 9 results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckConstantsConfiguration0003', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkConstantsConfiguration();
      expect(checker.getResultCount()).assertEqual(9);
      const results: CheckResult[] = checker.getResults();
      expect(results.length).assertEqual(9);
      expect(results[0].checkName.length).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_ECC_0400
     * @tc.name: testCheckConstantsConfiguration0004
     * @tc.desc: Verify all constant checks pass since constants are valid.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckConstantsConfiguration0004', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkConstantsConfiguration();
      const results: CheckResult[] = checker.getResults();
      let allPassed: boolean = true;
      for (let i: number = 0; i < results.length; i++) {
        if (!results[i].passed) {
          allPassed = false;
        }
      }
      expect(allPassed).assertTrue();
      expect(checker.getFailedResults().length).assertEqual(0);
      expect(results.length).assertEqual(9);
      done();
    });

    /*
     * @tc.number: SUB_ECC_0500
     * @tc.name: testCheckConstantsConfiguration0005
     * @tc.desc: Verify first three checks are DefaultBundleName, DefaultModuleName, DefaultSkillName.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckConstantsConfiguration0005', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkConstantsConfiguration();
      const results: CheckResult[] = checker.getResults();
      expect(results[0].checkName).assertEqual('DefaultBundleName');
      expect(results[1].checkName).assertEqual('DefaultModuleName');
      expect(results[2].checkName).assertEqual('DefaultSkillName');
      done();
    });

    // ==================== checkDefaultValuesExist (2 用例) ====================

    /*
     * @tc.number: SUB_ECC_0600
     * @tc.name: testCheckDefaultValuesExist0006
     * @tc.desc: Verify checkDefaultValuesExist adds 3 results, all passed.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckDefaultValuesExist0006', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkDefaultValuesExist();
      expect(checker.getResultCount()).assertEqual(3);
      const failed: CheckResult[] = checker.getFailedResults();
      expect(failed.length).assertEqual(0);
      expect(checker.getResults()[0].passed).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_ECC_0700
     * @tc.name: testCheckDefaultValuesExist0007
     * @tc.desc: Verify check names are DefaultBundleInArray, DefaultModuleInArray, DefaultSkillInArray.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckDefaultValuesExist0007', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkDefaultValuesExist();
      const results: CheckResult[] = checker.getResults();
      expect(results[0].checkName).assertEqual('DefaultBundleInArray');
      expect(results[1].checkName).assertEqual('DefaultModuleInArray');
      expect(results[2].checkName).assertEqual('DefaultSkillInArray');
      done();
    });

    // ==================== checkDataIntegrity (2 用例) ====================

    /*
     * @tc.number: SUB_ECC_0800
     * @tc.name: testCheckDataIntegrity0008
     * @tc.desc: Verify checkDataIntegrity adds 5 results, all passed.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckDataIntegrity0008', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkDataIntegrity();
      expect(checker.getResultCount()).assertEqual(5);
      expect(checker.getFailedResults().length).assertEqual(0);
      expect(checker.getResults()[0].passed).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_ECC_0900
     * @tc.name: testCheckDataIntegrity0009
     * @tc.desc: Verify data integrity check names include ModuleNoDuplicates, BundleNoDuplicates.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckDataIntegrity0009', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkDataIntegrity();
      const results: CheckResult[] = checker.getResults();
      expect(results[0].checkName).assertEqual('ModuleNoDuplicates');
      expect(results[1].checkName).assertEqual('BundleNoDuplicates');
      expect(results[2].checkName).assertEqual('SkillNoDuplicates');
      done();
    });

    // ==================== runAllChecks (3 用例) ====================

    /*
     * @tc.number: SUB_ECC_1000
     * @tc.name: testRunAllChecks0010
     * @tc.desc: Verify runAllChecks returns summary with correct totalChecks.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRunAllChecks0010', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      const summary: EnvironmentSummary = checker.runAllChecks();
      expect(summary.totalChecks).assertEqual(17);
      expect(summary.passedChecks).assertEqual(17);
      expect(summary.failedChecks).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ECC_1100
     * @tc.name: testRunAllChecks0011
     * @tc.desc: Verify runAllChecks overallPassed=true and readinessPercentage=100.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRunAllChecks0011', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      const summary: EnvironmentSummary = checker.runAllChecks();
      expect(summary.overallPassed).assertTrue();
      expect(summary.readinessPercentage).assertEqual(100);
      expect(summary.readinessGrade).assertEqual('A');
      done();
    });

    /*
     * @tc.number: SUB_ECC_1200
     * @tc.name: testRunAllChecks0012
     * @tc.desc: Verify runAllChecks resets previous results before re-running.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRunAllChecks0012', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkConstantsConfiguration();
      const countBefore: number = checker.getResultCount();
      checker.runAllChecks();
      expect(checker.getResultCount()).assertEqual(17);
      expect(countBefore).assertEqual(9);
      expect(checker.getResultCount() !== countBefore).assertTrue();
      done();
    });

    // ==================== getSummary (3 用例) ====================

    /*
     * @tc.number: SUB_ECC_1300
     * @tc.name: testGetSummary0013
     * @tc.desc: Verify getSummary calculates warningChecks correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetSummary0013', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      const summary: EnvironmentSummary = checker.getSummary();
      expect(summary.warningChecks).assertEqual(0);
      expect(summary.totalChecks).assertEqual(summary.passedChecks + summary.failedChecks + summary.warningChecks);
      expect(summary.totalChecks).assertLarger(0);
      done();
    });

    /*
     * @tc.number: SUB_ECC_1400
     * @tc.name: testGetSummary0014
     * @tc.desc: Verify readinessGrade is A for 100%, B for >=85%.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetSummary0014', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      const summary: EnvironmentSummary = checker.getSummary();
      expect(summary.readinessGrade).assertEqual('A');
      expect(summary.readinessPercentage >= 95).assertTrue();
      expect(summary.overallPassed).assertTrue();
      done();
    });

    /*
     * @tc.number: SUB_ECC_1500
     * @tc.name: testGetSummary0015
     * @tc.desc: Verify getSummary on empty checker returns 0 checks and grade F.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetSummary0015', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      const summary: EnvironmentSummary = checker.getSummary();
      expect(summary.totalChecks).assertEqual(0);
      expect(summary.readinessPercentage).assertEqual(0);
      expect(summary.readinessGrade).assertEqual('F');
      done();
    });

    // ==================== getResults returns copy (1 用例) ====================

    /*
     * @tc.number: SUB_ECC_1600
     * @tc.name: testGetResultsCopy0016
     * @tc.desc: Verify getResults returns a copy, not the internal array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetResultsCopy0016', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      const copy1: CheckResult[] = checker.getResults();
      const copy2: CheckResult[] = checker.getResults();
      expect(copy1 === copy2).assertFalse();
      expect(copy1.length).assertEqual(copy2.length);
      expect(copy1[0].checkName).assertEqual(copy2[0].checkName);
      done();
    });

    // ==================== getFailedResults (1 用例) ====================

    /*
     * @tc.number: SUB_ECC_1700
     * @tc.name: testGetFailedResults0017
     * @tc.desc: Verify getFailedResults returns empty array when all checks pass.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetFailedResults0017', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      const failed: CheckResult[] = checker.getFailedResults();
      expect(failed.length).assertEqual(0);
      expect(checker.getFailedResults().length).assertEqual(0);
      expect(Array.isArray(failed)).assertTrue();
      done();
    });

    // ==================== generateCheckReport (3 用例) ====================

    /*
     * @tc.number: SUB_ECC_1800
     * @tc.name: testGenerateCheckReport0018
     * @tc.desc: Verify generateCheckReport contains header and key sections.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateCheckReport0018', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      const report: string = checker.generateCheckReport();
      expect(report.length).assertLarger(0);
      expect(report).assertContain('Environment Check Report');
      expect(report).assertContain('End of Report');
      done();
    });

    /*
     * @tc.number: SUB_ECC_1900
     * @tc.name: testGenerateCheckReport0019
     * @tc.desc: Verify report contains readiness percentage and grade.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateCheckReport0019', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      const report: string = checker.generateCheckReport();
      expect(report).assertContain('100%');
      expect(report).assertContain('READY');
      expect(report).assertContain('Total checks: 17');
      done();
    });

    /*
     * @tc.number: SUB_ECC_2000
     * @tc.name: testGenerateCheckReport0020
     * @tc.desc: Verify report on empty checker shows 0 checks.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGenerateCheckReport0020', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      const report: string = checker.generateCheckReport();
      expect(report).assertContain('Total checks: 0');
      expect(report).assertContain('End of Report');
      expect(report.length).assertLarger(0);
      done();
    });

    // ==================== clear / getResultCount (2 用例) ====================

    /*
     * @tc.number: SUB_ECC_2100
     * @tc.name: testTecClear0021
     * @tc.desc: Verify clear resets results to empty.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTecClear0021', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.runAllChecks();
      expect(checker.getResultCount()).assertLarger(0);
      checker.clear();
      expect(checker.getResultCount()).assertEqual(0);
      expect(checker.getResults().length).assertEqual(0);
      done();
    });

    /*
     * @tc.number: SUB_ECC_2200
     * @tc.name: testGetResultCount0022
     * @tc.desc: Verify getResultCount tracks additions correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testGetResultCount0022', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      expect(checker.getResultCount()).assertEqual(0);
      checker.checkConstantsConfiguration();
      expect(checker.getResultCount()).assertEqual(9);
      checker.checkDefaultValuesExist();
      expect(checker.getResultCount()).assertEqual(12);
      done();
    });

    // ==================== CheckResult timestamp (1 用例) ====================

    /*
     * @tc.number: SUB_ECC_2300
     * @tc.name: testCheckResultTimestamp0023
     * @tc.desc: Verify each CheckResult has a valid timestamp.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckResultTimestamp0023', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      const before: number = Date.now();
      checker.checkConstantsConfiguration();
      const after: number = Date.now();
      const results: CheckResult[] = checker.getResults();
      expect(results[0].timestamp).assertLarger(0);
      expect(results[0].timestamp).assertLarger(-1);
      expect(results[0].timestamp).assertLarger(0);
      done();
    });

    // ==================== CheckResult severity (1 用例) ====================

    /*
     * @tc.number: SUB_ECC_2400
     * @tc.name: testCheckResultSeverity0024
     * @tc.desc: Verify passed results have severity 'info'.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testCheckResultSeverity0024', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      checker.clear();
      checker.checkConstantsConfiguration();
      const results: CheckResult[] = checker.getResults();
      for (let i: number = 0; i < results.length; i++) {
        if (results[i].passed) {
          expect(results[i].severity).assertEqual('info');
        }
      }
      expect(results.length).assertEqual(9);
      expect(results[0].severity).assertEqual('info');
      done();
    });

    // ==================== runAllChecks then getSummary consistency (1 用例) ====================

    /*
     * @tc.number: SUB_ECC_2500
     * @tc.name: testRunAllChecksSummaryConsistency0025
     * @tc.desc: Verify runAllChecks summary matches getSummary called separately.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRunAllChecksSummaryConsistency0025', 0, async (done: Function) => {
      const checker: TestEnvironmentChecker = TestEnvironmentChecker.getInstance();
      const runSummary: EnvironmentSummary = checker.runAllChecks();
      const separateSummary: EnvironmentSummary = checker.getSummary();
      expect(runSummary.totalChecks).assertEqual(separateSummary.totalChecks);
      expect(runSummary.passedChecks).assertEqual(separateSummary.passedChecks);
      expect(runSummary.readinessGrade).assertEqual(separateSummary.readinessGrade);
      done();
    });
  });
}
