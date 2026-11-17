/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ErrorCategory, ErrorInfo, ErrorReport, ErrorSeverity, categoryOf, describeError, formatCode,
  formatErrorReport, hintOf, isRetryable, lookupError, parseErrorCode, severityOf } from '../main/ets/core/ErrorCodeCore';

const CODES: number[] = [0, 13900001, 13900002, 13900004, 13900005, 13900008, 13900011, 13900012,
  13900013, 13900015, 13900019, 13900020, 13900025, 13900030, 13900042, 19100001, 19100002, 19100003,
  19100004];
const SAMPLE_SEC: number = 1700000000;

function reportOf(code: number): string {
  return formatErrorReport(new ErrorReport(code, '', '', 0), true);
}

export default function errorCodeFlowMatrixTest(): void {
  describe('ErrorCodeFlowMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0001
     * @tc.name      testReportNotFound0001
     * @tc.desc      missing file reports use the file category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNotFound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = reportOf(13900002);
      expect(text.indexOf('category=file_not_found') > 0).assertTrue();
      expect(text.indexOf('severity=error') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0002
     * @tc.name      testReportPermission0002
     * @tc.desc      permission reports use the permission category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportPermission0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(13900012).indexOf('category=permission_denied') > 0).assertTrue();
      expect(reportOf(19100004).indexOf('category=permission_denied') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0003
     * @tc.name      testReportStorage0003
     * @tc.desc      storage reports use the storage category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportStorage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(13900025).indexOf('category=storage_full') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0004
     * @tc.name      testReportNetwork0004
     * @tc.desc      timeout reports use the network category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNetwork0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(13900042).indexOf('category=network') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0005
     * @tc.name      testReportDlp0005
     * @tc.desc      dlp reports use the policy category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportDlp0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(19100001).indexOf('category=dlp_policy') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0006
     * @tc.name      testReportAccount0006
     * @tc.desc      account reports use the account category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportAccount0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(19100002).indexOf('category=account') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0007
     * @tc.name      testReportUnknown0007
     * @tc.desc      unknown reports use the unknown category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportUnknown0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(777).indexOf('category=unknown') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0008
     * @tc.name      testReportSuccess0008
     * @tc.desc      success reports use the none category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportSuccess0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(0)).assertEqual(
        'code=0x00000000, category=none, severity=info, time=1970/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0009
     * @tc.name      testReportSections0009
     * @tc.desc      reports include operation and detail when present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportSections0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = formatErrorReport(new ErrorReport(13900002, 'open', 'failed', SAMPLE_SEC), true);
      expect(text.indexOf('operation=open') > 0).assertTrue();
      expect(text.indexOf('detail=failed') > 0).assertTrue();
      expect(text.indexOf('time=2023/11/14 22:13:20') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0010
     * @tc.name      testReportOmitTime0010
     * @tc.desc      invalid times are omitted from reports
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportOmitTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = formatErrorReport(new ErrorReport(13900002, '', '', -100), true);
      expect(text.indexOf('time=')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0011
     * @tc.name      testDescribeAll0011
     * @tc.desc      every mapped code has a message
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeAll0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        expect(describeError(CODES[index]).length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0012
     * @tc.name      testHintAll0012
     * @tc.desc      every error code has a hint and success does not
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintAll0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(hintOf(0)).assertEqual('');
      for (let index = 1; index < CODES.length; index++) {
        expect(hintOf(CODES[index]).length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0013
     * @tc.name      testCategoryAll0013
     * @tc.desc      every mapped code resolves to a category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryAll0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        const info: ErrorInfo = lookupError(CODES[index]);
        expect(info.category).assertEqual(categoryOf(CODES[index]));
        expect(info.severity).assertEqual(severityOf(CODES[index]));
        expect(info.retryable).assertEqual(isRetryable(CODES[index]));
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0014
     * @tc.name      testRetryableSweep0014
     * @tc.desc      retryable codes are limited to transient errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableSweep0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const retryable: number[] = [13900004, 13900005, 13900011, 13900015, 13900042];
      for (let index = 0; index < retryable.length; index++) {
        expect(isRetryable(retryable[index])).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0015
     * @tc.name      testNonRetryableSweep0015
     * @tc.desc      permanent codes are not retryable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNonRetryableSweep0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const permanent: number[] = [13900001, 13900002, 13900012, 13900020, 13900025, 19100001, 19100002,
        19100003, 19100004];
      for (let index = 0; index < permanent.length; index++) {
        expect(isRetryable(permanent[index])).assertFalse();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0016
     * @tc.name      testSeverityWarnings0016
     * @tc.desc      transient codes use warning severity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSeverityWarnings0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const warnings: number[] = [13900004, 13900011, 13900015];
      for (let index = 0; index < warnings.length; index++) {
        expect(severityOf(warnings[index])).assertEqual(ErrorSeverity.WARNING);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0017
     * @tc.name      testSeverityErrors0017
     * @tc.desc      permanent codes use error severity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSeverityErrors0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const errors: number[] = [13900002, 13900012, 13900025, 19100001];
      for (let index = 0; index < errors.length; index++) {
        expect(severityOf(errors[index])).assertEqual(ErrorSeverity.ERROR);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0018
     * @tc.name      testFormatRoundTrip0018
     * @tc.desc      formatting and parsing round trip for known codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatRoundTrip0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        expect(parseErrorCode(formatCode(CODES[index]))).assertEqual(CODES[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0019
     * @tc.name      testParseInvalidSet0019
     * @tc.desc      invalid code texts are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidSet0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const invalid: string[] = ['', 'abc', '0x', '1.5', '01', '--1'];
      for (let index = 0; index < invalid.length; index++) {
        expect(parseErrorCode(invalid[index])).assertEqual(-1);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0020
     * @tc.name      testFormatInvalidSet0020
     * @tc.desc      invalid numbers format as all ones
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatInvalidSet0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatCode(-1)).assertEqual('0xFFFFFFFF');
      expect(formatCode(Number.NEGATIVE_INFINITY)).assertEqual('0xFFFFFFFF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0021
     * @tc.name      testFractionLookup0021
     * @tc.desc      fractional lookups normalize before matching
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFractionLookup0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(lookupError(13900025.8).category).assertEqual(ErrorCategory.STORAGE_FULL);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0022
     * @tc.name      testSuccessLookup0022
     * @tc.desc      near zero values still resolve to success
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuccessLookup0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(lookupError(0.9).category).assertEqual(ErrorCategory.NONE);
      expect(describeError(0.9)).assertEqual('操作成功');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0023
     * @tc.name      testNegativeLookup0023
     * @tc.desc      negative lookups fall back to unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNegativeLookup0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(lookupError(-100).category).assertEqual(ErrorCategory.UNKNOWN);
      expect(describeError(-100)).assertEqual('未知错误');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0024
     * @tc.name      testReportNegativeCode0024
     * @tc.desc      negative codes format as all ones in reports
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNegativeCode0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(reportOf(-1).indexOf('code=0xFFFFFFFF') === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0025
     * @tc.name      testReportCommaDetail0025
     * @tc.desc      commas inside details are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportCommaDetail0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = formatErrorReport(new ErrorReport(13900002, '', 'a, b', 0), true);
      expect(text.indexOf('detail=a, b') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0026
     * @tc.name      testReportUnmapped0026
     * @tc.desc      unmapped codes report as unknown without throwing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportUnmapped0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = reportOf(12345678);
      expect(text.indexOf('category=unknown') > 0).assertTrue();
      expect(text.indexOf('severity=error') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORFLOW_0027
     * @tc.name      testInfoCodeField0027
     * @tc.desc      error info keeps the normalized code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInfoCodeField0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(lookupError(13900002.7).code).assertEqual(13900002);
      expect(lookupError(0).code).assertEqual(0);
    })
  });
}
