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
import { TestLog } from '../harness/TestLog';
import type { Finding } from '../harness/FindingTypes';
import { FindingUtils, Severity } from '../harness/FindingTypes';
import { FindingReport } from '../harness/FindingReport';
export default function FindingReportValidationTest(): void {
  describe('FindingReportValidationTest', () => {
    // Yield a macrotask to keep large suites responsive to the main-thread watchdog.
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4200
     * @tc.name      testFindingReportCount
     * @tc.desc      Checks that the report counts every finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportCount', 'case begin', 'count report check');
      TestLog.step('testFindingReportCount', 'count report check');
      const actual: number = new FindingReport(findings).count();
      TestLog.text('testFindingReportCount', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportCount', 'case end', 'count report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4201
     * @tc.name      testFindingReportErrorCount
     * @tc.desc      Checks that the report counts error findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportErrorCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportErrorCount', 'case begin', 'errorcount report check');
      TestLog.step('testFindingReportErrorCount', 'errorcount report check');
      const actual: number = new FindingReport(findings).errorCount();
      TestLog.text('testFindingReportErrorCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportErrorCount', 'case end', 'errorcount report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4202
     * @tc.name      testFindingReportWarningCount
     * @tc.desc      Checks that the report counts warning findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportWarningCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportWarningCount', 'case begin', 'warningcount report check');
      TestLog.step('testFindingReportWarningCount', 'warningcount report check');
      const actual: number = new FindingReport(findings).warningCount();
      TestLog.text('testFindingReportWarningCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportWarningCount', 'case end', 'warningcount report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4203
     * @tc.name      testFindingReportInfoCount
     * @tc.desc      Checks that the report counts info findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportInfoCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportInfoCount', 'case begin', 'infocount report check');
      TestLog.step('testFindingReportInfoCount', 'infocount report check');
      const actual: number = new FindingReport(findings).infoCount();
      TestLog.text('testFindingReportInfoCount', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportInfoCount', 'case end', 'infocount report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4204
     * @tc.name      testFindingReportHasErrors
     * @tc.desc      Checks that the report detects errors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportHasErrors',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportHasErrors', 'case begin', 'haserrors report check');
      TestLog.step('testFindingReportHasErrors', 'haserrors report check');
      const actual: boolean = new FindingReport(findings).hasErrors();
      TestLog.text('testFindingReportHasErrors', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportHasErrors', 'case end', 'haserrors report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4205
     * @tc.name      testFindingReportHasWarnings
     * @tc.desc      Checks that the report detects warnings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportHasWarnings',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportHasWarnings', 'case begin', 'haswarnings report check');
      TestLog.step('testFindingReportHasWarnings', 'haswarnings report check');
      const actual: boolean = new FindingReport(findings).hasWarnings();
      TestLog.text('testFindingReportHasWarnings', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportHasWarnings', 'case end', 'haswarnings report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4206
     * @tc.name      testFindingReportIsEmpty
     * @tc.desc      Checks that a populated report is not empty.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportIsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportIsEmpty', 'case begin', 'isempty report check');
      TestLog.step('testFindingReportIsEmpty', 'isempty report check');
      const actual: boolean = new FindingReport(findings).isEmpty();
      TestLog.text('testFindingReportIsEmpty', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testFindingReportIsEmpty', 'case end', 'isempty report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4207
     * @tc.name      testFindingReportEmptyIsEmpty
     * @tc.desc      Checks that an empty report is empty.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportEmptyIsEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportEmptyIsEmpty', 'case begin', 'emptyisempty report check');
      TestLog.step('testFindingReportEmptyIsEmpty', 'emptyisempty report check');
      const actual: boolean = new FindingReport([]).isEmpty();
      TestLog.text('testFindingReportEmptyIsEmpty', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportEmptyIsEmpty', 'case end', 'emptyisempty report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4208
     * @tc.name      testFindingReportEmptyCount
     * @tc.desc      Checks that an empty report has no findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportEmptyCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportEmptyCount', 'case begin', 'emptycount report check');
      TestLog.step('testFindingReportEmptyCount', 'emptycount report check');
      const actual: number = new FindingReport([]).count();
      TestLog.text('testFindingReportEmptyCount', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testFindingReportEmptyCount', 'case end', 'emptycount report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4209
     * @tc.name      testFindingReportMaxSeverity
     * @tc.desc      Checks that the report reports the highest severity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportMaxSeverity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportMaxSeverity', 'case begin', 'maxseverity report check');
      TestLog.step('testFindingReportMaxSeverity', 'maxseverity report check');
      const actual: number = new FindingReport(findings).maxSeverity();
      TestLog.text('testFindingReportMaxSeverity', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportMaxSeverity', 'case end', 'maxseverity report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4210
     * @tc.name      testFindingReportMaxSeverityEmpty
     * @tc.desc      Checks that an empty report reports info severity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportMaxSeverityEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportMaxSeverityEmpty', 'case begin', 'maxseverityempty report check');
      TestLog.step('testFindingReportMaxSeverityEmpty', 'maxseverityempty report check');
      const actual: number = new FindingReport([]).maxSeverity();
      TestLog.text('testFindingReportMaxSeverityEmpty', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportMaxSeverityEmpty', 'case end', 'maxseverityempty report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4211
     * @tc.name      testFindingReportSortedFirst
     * @tc.desc      Checks that the sorted report starts with the error.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSortedFirst',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSortedFirst', 'case begin', 'sortedfirst report check');
      TestLog.step('testFindingReportSortedFirst', 'sortedfirst report check');
      const actual: number = new FindingReport(findings).sortedFindings()[0].severity;
      TestLog.text('testFindingReportSortedFirst', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportSortedFirst', 'case end', 'sortedfirst report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4212
     * @tc.name      testFindingReportSortedLast
     * @tc.desc      Checks that the sorted report ends with the info.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSortedLast',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSortedLast', 'case begin', 'sortedlast report check');
      TestLog.step('testFindingReportSortedLast', 'sortedlast report check');
      const actual: number = new FindingReport(findings).sortedFindings()[2].severity;
      TestLog.text('testFindingReportSortedLast', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportSortedLast', 'case end', 'sortedlast report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4213
     * @tc.name      testFindingReportCodeOrdered
     * @tc.desc      Checks that the report codes are sorted ascending.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportCodeOrdered',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportCodeOrdered', 'case begin', 'codeordered report check');
      TestLog.step('testFindingReportCodeOrdered', 'codeordered report check');
      const actual: string = new FindingReport(findings).codes()[0];
      TestLog.text('testFindingReportCodeOrdered', 'actual value', String(actual));
      expect(actual).assertEqual('A_CODE');
      TestLog.text('testFindingReportCodeOrdered', 'case end', 'codeordered report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4214
     * @tc.name      testFindingReportPathCount
     * @tc.desc      Checks that the report returns distinct paths.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportPathCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportPathCount', 'case begin', 'pathcount report check');
      TestLog.step('testFindingReportPathCount', 'pathcount report check');
      const actual: number = new FindingReport(findings).paths().length;
      TestLog.text('testFindingReportPathCount', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportPathCount', 'case end', 'pathcount report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4215
     * @tc.name      testFindingReportTopCode
     * @tc.desc      Checks that the most frequent code is first.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportTopCode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportTopCode', 'case begin', 'topcode report check');
      TestLog.step('testFindingReportTopCode', 'topcode report check');
      const actual: string = new FindingReport(findings).topCodes(1)[0];
      TestLog.text('testFindingReportTopCode', 'actual value', String(actual));
      expect(actual).assertEqual('A_CODE');
      TestLog.text('testFindingReportTopCode', 'case end', 'topcode report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4216
     * @tc.name      testFindingReportTopCodeLimit
     * @tc.desc      Checks that the top code limit is honoured.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportTopCodeLimit',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportTopCodeLimit', 'case begin', 'topcodelimit report check');
      TestLog.step('testFindingReportTopCodeLimit', 'topcodelimit report check');
      const actual: number = new FindingReport(findings).topCodes(2).length;
      TestLog.text('testFindingReportTopCodeLimit', 'actual value', String(actual));
      expect(actual).assertEqual(2);
      TestLog.text('testFindingReportTopCodeLimit', 'case end', 'topcodelimit report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4217
     * @tc.name      testFindingReportTopCodeZero
     * @tc.desc      Checks that a zero limit returns no codes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportTopCodeZero',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportTopCodeZero', 'case begin', 'topcodezero report check');
      TestLog.step('testFindingReportTopCodeZero', 'topcodezero report check');
      const actual: number = new FindingReport(findings).topCodes(0).length;
      TestLog.text('testFindingReportTopCodeZero', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testFindingReportTopCodeZero', 'case end', 'topcodezero report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4218
     * @tc.name      testFindingReportCountByCode
     * @tc.desc      Checks that a code is counted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportCountByCode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportCountByCode', 'case begin', 'countbycode report check');
      TestLog.step('testFindingReportCountByCode', 'countbycode report check');
      const actual: number = new FindingReport(findings).countByCode('A_CODE');
      TestLog.text('testFindingReportCountByCode', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportCountByCode', 'case end', 'countbycode report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4219
     * @tc.name      testFindingReportCountByMissingCode
     * @tc.desc      Checks that a missing code is counted as zero.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportCountByMissingCode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportCountByMissingCode', 'case begin', 'countbymissingcode report check');
      TestLog.step('testFindingReportCountByMissingCode', 'countbymissingcode report check');
      const actual: number = new FindingReport(findings).countByCode('Z_CODE');
      TestLog.text('testFindingReportCountByMissingCode', 'actual value', String(actual));
      expect(actual).assertEqual(0);
      TestLog.text('testFindingReportCountByMissingCode', 'case end', 'countbymissingcode report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4220
     * @tc.name      testFindingReportCountBySeverity
     * @tc.desc      Checks that a severity is counted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportCountBySeverity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportCountBySeverity', 'case begin', 'countbyseverity report check');
      TestLog.step('testFindingReportCountBySeverity', 'countbyseverity report check');
      const actual: number = new FindingReport(findings).countBySeverity(Severity.ERROR);
      TestLog.text('testFindingReportCountBySeverity', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportCountBySeverity', 'case end', 'countbyseverity report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4221
     * @tc.name      testFindingReportSummaryText
     * @tc.desc      Checks that the summary starts with the finding count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSummaryText',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSummaryText', 'case begin', 'summarytext report check');
      TestLog.step('testFindingReportSummaryText', 'summarytext report check');
      const actual: string = new FindingReport(findings).summary().substring(0, 10);
      TestLog.text('testFindingReportSummaryText', 'actual value', String(actual));
      expect(actual).assertEqual('findings=3');
      TestLog.text('testFindingReportSummaryText', 'case end', 'summarytext report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4222
     * @tc.name      testFindingReportFormatLines
     * @tc.desc      Checks that every finding is formatted as one line.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportFormatLines',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportFormatLines', 'case begin', 'formatlines report check');
      TestLog.step('testFindingReportFormatLines', 'formatlines report check');
      const actual: number = new FindingReport(findings).formatLines().length;
      TestLog.text('testFindingReportFormatLines', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportFormatLines', 'case end', 'formatlines report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4223
     * @tc.name      testFindingReportIsSeverityOrdered
     * @tc.desc      Checks that the sorted report is severity ordered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportIsSeverityOrdered',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportIsSeverityOrdered', 'case begin', 'isseverityordered report check');
      TestLog.step('testFindingReportIsSeverityOrdered', 'isseverityordered report check');
      const actual: boolean = new FindingReport(findings).isSeverityOrdered();
      TestLog.text('testFindingReportIsSeverityOrdered', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportIsSeverityOrdered', 'case end', 'isseverityordered report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4224
     * @tc.name      testFindingReportAllWellFormed
     * @tc.desc      Checks that the report findings are well formed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportAllWellFormed',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportAllWellFormed', 'case begin', 'allwellformed report check');
      TestLog.step('testFindingReportAllWellFormed', 'allwellformed report check');
      const actual: boolean = new FindingReport(findings).allWellFormed();
      TestLog.text('testFindingReportAllWellFormed', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportAllWellFormed', 'case end', 'allwellformed report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4225
     * @tc.name      testFindingReportMergeCount
     * @tc.desc      Checks that merging two finding lists counts every finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportMergeCount',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportMergeCount', 'case begin', 'mergecount report check');
      TestLog.step('testFindingReportMergeCount', 'mergecount report check');
      const actual: number = FindingReport.merge([findings.slice(0, 2), findings.slice(2)]).count();
      TestLog.text('testFindingReportMergeCount', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportMergeCount', 'case end', 'mergecount report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4226
     * @tc.name      testFindingReportSeverityNameError
     * @tc.desc      Checks that the error severity label is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSeverityNameError',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSeverityNameError', 'case begin', 'severitynameerror report check');
      TestLog.step('testFindingReportSeverityNameError', 'severitynameerror report check');
      const actual: string = FindingReport.severityName(Severity.ERROR);
      TestLog.text('testFindingReportSeverityNameError', 'actual value', String(actual));
      expect(actual).assertEqual('ERROR');
      TestLog.text('testFindingReportSeverityNameError', 'case end', 'severitynameerror report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4227
     * @tc.name      testFindingReportSeverityNameWarn
     * @tc.desc      Checks that the warning severity label is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSeverityNameWarn',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSeverityNameWarn', 'case begin', 'severitynamewarn report check');
      TestLog.step('testFindingReportSeverityNameWarn', 'severitynamewarn report check');
      const actual: string = FindingReport.severityName(Severity.WARN);
      TestLog.text('testFindingReportSeverityNameWarn', 'actual value', String(actual));
      expect(actual).assertEqual('WARN');
      TestLog.text('testFindingReportSeverityNameWarn', 'case end', 'severitynamewarn report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4228
     * @tc.name      testFindingReportSeverityNameInfo
     * @tc.desc      Checks that the info severity label is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSeverityNameInfo',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSeverityNameInfo', 'case begin', 'severitynameinfo report check');
      TestLog.step('testFindingReportSeverityNameInfo', 'severitynameinfo report check');
      const actual: string = FindingReport.severityName(Severity.INFO);
      TestLog.text('testFindingReportSeverityNameInfo', 'actual value', String(actual));
      expect(actual).assertEqual('INFO');
      TestLog.text('testFindingReportSeverityNameInfo', 'case end', 'severitynameinfo report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4229
     * @tc.name      testFindingReportSignaturePrefix
     * @tc.desc      Checks that the signature contains the severity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSignaturePrefix',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSignaturePrefix', 'case begin', 'signatureprefix report check');
      TestLog.step('testFindingReportSignaturePrefix', 'signatureprefix report check');
      const actual: string = FindingUtils.signature(findings[0]).substring(0, 2);
      TestLog.text('testFindingReportSignaturePrefix', 'actual value', String(actual));
      expect(actual).assertEqual('3:');
      TestLog.text('testFindingReportSignaturePrefix', 'case end', 'signatureprefix report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4230
     * @tc.name      testFindingReportSignatureList
     * @tc.desc      Checks that the signature list joins every finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSignatureList',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSignatureList', 'case begin', 'signaturelist report check');
      TestLog.step('testFindingReportSignatureList', 'signaturelist report check');
      const actual: number = FindingUtils.signatureList(findings).split(',').length;
      TestLog.text('testFindingReportSignatureList', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportSignatureList', 'case end', 'signaturelist report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4231
     * @tc.name      testFindingReportUniquePairs
     * @tc.desc      Checks that distinct code and path pairs are detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportUniquePairs',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportUniquePairs', 'case begin', 'uniquepairs report check');
      TestLog.step('testFindingReportUniquePairs', 'uniquepairs report check');
      const actual: boolean = FindingUtils.hasUniqueCodeAndPath(findings);
      TestLog.text('testFindingReportUniquePairs', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportUniquePairs', 'case end', 'uniquepairs report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4232
     * @tc.name      testFindingReportDuplicatePairs
     * @tc.desc      Checks that duplicated code and path pairs are detected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportDuplicatePairs',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportDuplicatePairs', 'case begin', 'duplicatepairs report check');
      TestLog.step('testFindingReportDuplicatePairs', 'duplicatepairs report check');
      const actual: boolean = FindingUtils.hasUniqueCodeAndPath([findings[0], findings[0]]);
      TestLog.text('testFindingReportDuplicatePairs', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testFindingReportDuplicatePairs', 'case end', 'duplicatepairs report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4233
     * @tc.name      testFindingReportFilterByCode
     * @tc.desc      Checks that a code filter returns the matching finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportFilterByCode',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportFilterByCode', 'case begin', 'filterbycode report check');
      TestLog.step('testFindingReportFilterByCode', 'filterbycode report check');
      const actual: number = FindingUtils.filterByCode(findings, 'B_CODE').length;
      TestLog.text('testFindingReportFilterByCode', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportFilterByCode', 'case end', 'filterbycode report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4234
     * @tc.name      testFindingReportFilterBySeverity
     * @tc.desc      Checks that a severity filter returns the matching finding.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportFilterBySeverity',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportFilterBySeverity', 'case begin', 'filterbyseverity report check');
      TestLog.step('testFindingReportFilterBySeverity', 'filterbyseverity report check');
      const actual: number = FindingUtils.filterBySeverity(findings, Severity.WARN).length;
      TestLog.text('testFindingReportFilterBySeverity', 'actual value', String(actual));
      expect(actual).assertEqual(1);
      TestLog.text('testFindingReportFilterBySeverity', 'case end', 'filterbyseverity report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4235
     * @tc.name      testFindingReportCodesDistinct
     * @tc.desc      Checks that distinct codes are collected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportCodesDistinct',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportCodesDistinct', 'case begin', 'codesdistinct report check');
      TestLog.step('testFindingReportCodesDistinct', 'codesdistinct report check');
      const actual: number = FindingUtils.codes(findings).length;
      TestLog.text('testFindingReportCodesDistinct', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportCodesDistinct', 'case end', 'codesdistinct report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4236
     * @tc.name      testFindingReportMaxSeverityHelper
     * @tc.desc      Checks that the highest severity is returned.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportMaxSeverityHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportMaxSeverityHelper', 'case begin', 'maxseverityhelper report check');
      TestLog.step('testFindingReportMaxSeverityHelper', 'maxseverityhelper report check');
      const actual: number = FindingUtils.maxSeverity(findings);
      TestLog.text('testFindingReportMaxSeverityHelper', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportMaxSeverityHelper', 'case end', 'maxseverityhelper report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4237
     * @tc.name      testFindingReportHasErrorHelper
     * @tc.desc      Checks that the error helper detects errors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportHasErrorHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportHasErrorHelper', 'case begin', 'haserrorhelper report check');
      TestLog.step('testFindingReportHasErrorHelper', 'haserrorhelper report check');
      const actual: boolean = FindingUtils.hasError(findings);
      TestLog.text('testFindingReportHasErrorHelper', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportHasErrorHelper', 'case end', 'haserrorhelper report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4238
     * @tc.name      testFindingReportHasWarningHelper
     * @tc.desc      Checks that the warning helper detects warnings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportHasWarningHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportHasWarningHelper', 'case begin', 'haswarninghelper report check');
      TestLog.step('testFindingReportHasWarningHelper', 'haswarninghelper report check');
      const actual: boolean = FindingUtils.hasWarning(findings);
      TestLog.text('testFindingReportHasWarningHelper', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportHasWarningHelper', 'case end', 'haswarninghelper report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4239
     * @tc.name      testFindingReportAllWellFormedHelper
     * @tc.desc      Checks that the well formed helper accepts valid findings.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportAllWellFormedHelper',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportAllWellFormedHelper', 'case begin', 'allwellformedhelper report check');
      TestLog.step('testFindingReportAllWellFormedHelper', 'allwellformedhelper report check');
      const actual: boolean = FindingUtils.allWellFormed(findings);
      TestLog.text('testFindingReportAllWellFormedHelper', 'actual value', String(actual));
      expect(actual).assertTrue();
      TestLog.text('testFindingReportAllWellFormedHelper', 'case end', 'allwellformedhelper report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4240
     * @tc.name      testFindingReportBrokenFindingRejected
     * @tc.desc      Checks that a finding without a path is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportBrokenFindingRejected',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportBrokenFindingRejected', 'case begin', 'brokenfindingrejected report check');
      TestLog.step('testFindingReportBrokenFindingRejected', 'brokenfindingrejected report check');
      const actual: boolean = 
        FindingUtils.allWellFormed([FindingUtils.create('X_CODE', Severity.ERROR, '', 'message')]);
      TestLog.text('testFindingReportBrokenFindingRejected', 'actual value', String(actual));
      expect(actual).assertFalse();
      TestLog.text('testFindingReportBrokenFindingRejected', 'case end', 'brokenfindingrejected report check');
    })

    /**
     * @tc.number    SUB_SYS_MODULE_CONFIG_4241
     * @tc.name      testFindingReportSortKeepsSize
     * @tc.desc      Checks that sorting keeps the finding count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testFindingReportSortKeepsSize',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const findings: Finding[] = [
        FindingUtils.create('A_CODE', Severity.ERROR, 'app.a', 'first finding'),
        FindingUtils.create('B_CODE', Severity.WARN, 'app.b', 'second finding'),
        FindingUtils.create('C_CODE', Severity.INFO, 'app.c', 'third finding')
      ];
      TestLog.text('testFindingReportSortKeepsSize', 'case begin', 'sortkeepssize report check');
      TestLog.step('testFindingReportSortKeepsSize', 'sortkeepssize report check');
      const actual: number = FindingUtils.sort(findings).length;
      TestLog.text('testFindingReportSortKeepsSize', 'actual value', String(actual));
      expect(actual).assertEqual(3);
      TestLog.text('testFindingReportSortKeepsSize', 'case end', 'sortkeepssize report check');
    })

  })
}
