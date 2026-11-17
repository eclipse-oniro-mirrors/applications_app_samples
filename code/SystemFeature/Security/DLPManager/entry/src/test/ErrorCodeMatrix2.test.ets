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
import { ErrorCategory, ErrorInfo, ErrorReport, ErrorSeverity, describeError, formatCode,
  formatErrorReport, hintOf, isRetryable, isSuccess, lookupError, normalizeCode, parseErrorCode,
  severityOf } from '../main/ets/core/ErrorCodeCore';

const CODES: number[] = [0, 13900001, 13900002, 13900004, 13900005, 13900008, 13900011, 13900012,
  13900013, 13900025, 13900042, 19100001, 19100002, 19100003, 19100004];

export default function errorCodeMatrix2Test(): void {
  describe('ErrorCodeMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0001
     * @tc.name      testLookupConsistency0001
     * @tc.desc      lookup results are internally consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupConsistency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        const info: ErrorInfo = lookupError(CODES[index]);
        expect(info.code).assertEqual(CODES[index]);
        expect(info.category).assertEqual(lookupError(CODES[index]).category);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0002
     * @tc.name      testDescribeLoop0002
     * @tc.desc      every mapped code has a description
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeLoop0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        expect(describeError(CODES[index]).length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0003
     * @tc.name      testHintLoop0003
     * @tc.desc      error hints are provided for error codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintLoop0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(hintOf(0)).assertEqual('');
      for (let index = 1; index < CODES.length; index++) {
        expect(hintOf(CODES[index]).length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0004
     * @tc.name      testFormatLoop0004
     * @tc.desc      formatting and parsing round trip for known codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatLoop0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        expect(parseErrorCode(formatCode(CODES[index]))).assertEqual(CODES[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0005
     * @tc.name      testSeverityLoop0005
     * @tc.desc      severity classifications are stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSeverityLoop0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(severityOf(0)).assertEqual(ErrorSeverity.INFO);
      expect(severityOf(13900004)).assertEqual(ErrorSeverity.WARNING);
      expect(severityOf(13900005)).assertEqual(ErrorSeverity.ERROR);
      expect(severityOf(13900025)).assertEqual(ErrorSeverity.ERROR);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0006
     * @tc.name      testRetryableLoop0006
     * @tc.desc      retryable flags cover transient errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableLoop0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const retryable: number[] = [13900004, 13900005, 13900011, 13900015, 13900042];
      for (let index = 0; index < retryable.length; index++) {
        expect(isRetryable(retryable[index])).assertTrue();
      }
      expect(isRetryable(13900002)).assertFalse();
      expect(isRetryable(13900012)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0007
     * @tc.name      testReportLoop0007
     * @tc.desc      reports contain their formatted codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportLoop0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const codes: number[] = [13900001, 13900002, 13900025];
      for (let index = 0; index < codes.length; index++) {
        const text: string = formatErrorReport(new ErrorReport(codes[index], '', '', 0), true);
        expect(text.indexOf('code=' + formatCode(codes[index])) === 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0008
     * @tc.name      testReportSuccess0008
     * @tc.desc      success reports keep the none category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportSuccess0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatErrorReport(new ErrorReport(0, '', '', 0), true)).assertEqual(
        'code=0x00000000, category=none, severity=info, time=1970/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0009
     * @tc.name      testUnknownHandling0009
     * @tc.desc      unknown and negative codes fall back safely
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownHandling0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(lookupError(9999).category).assertEqual(ErrorCategory.UNKNOWN);
      expect(lookupError(-1).category).assertEqual(ErrorCategory.UNKNOWN);
      expect(lookupError(Number.NaN).category).assertEqual(ErrorCategory.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0010
     * @tc.name      testFormattedCodes0010
     * @tc.desc      formatted codes are eight digit hex
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormattedCodes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatCode(0)).assertEqual('0x00000000');
      expect(formatCode(13900001)).assertEqual('0x00D418E1');
      expect(formatCode(13900002)).assertEqual('0x00D418E2');
      expect(formatCode(13900025)).assertEqual('0x00D418F9');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0011
     * @tc.name      testParseInvalidLoop0011
     * @tc.desc      invalid code texts are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidLoop0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const invalid: string[] = ['', 'abc', '0x', '1.5', '01'];
      for (let index = 0; index < invalid.length; index++) {
        expect(parseErrorCode(invalid[index])).assertEqual(-1);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0012
     * @tc.name      testSuccessLoop0012
     * @tc.desc      success detection uses normalized codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuccessLoop0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isSuccess(0)).assertTrue();
      expect(isSuccess(0.9)).assertTrue();
      expect(isSuccess(1)).assertFalse();
      expect(isSuccess(-1)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0013
     * @tc.name      testNormalizeLoop0013
     * @tc.desc      normalization floors and rejects non finite values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeLoop0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(normalizeCode(1.9)).assertEqual(1);
      expect(normalizeCode(-1.1)).assertEqual(-2);
      expect(normalizeCode(Number.POSITIVE_INFINITY)).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0014
     * @tc.name      testReportOmitTime0014
     * @tc.desc      invalid times are omitted from reports
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportOmitTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatErrorReport(new ErrorReport(13900002, '', '', -5), true).indexOf('time='))
        .assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0015
     * @tc.name      testReportComma0015
     * @tc.desc      commas inside report details are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportComma0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = formatErrorReport(new ErrorReport(13900002, '', 'a, b', 0), true);
      expect(text.indexOf('detail=a, b') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0016
     * @tc.name      testMessageMatrix0016
     * @tc.desc      messages cover the main error classes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMessageMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(describeError(0)).assertEqual('操作成功');
      expect(describeError(13900002)).assertEqual('文件不存在');
      expect(describeError(13900025)).assertEqual('存储空间不足');
      expect(describeError(13900042)).assertEqual('操作超时');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0017
     * @tc.name      testCategoryMatrix0017
     * @tc.desc      categories cover the main error classes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(lookupError(13900001).category).assertEqual(ErrorCategory.PERMISSION_DENIED);
      expect(lookupError(13900025).category).assertEqual(ErrorCategory.STORAGE_FULL);
      expect(lookupError(13900042).category).assertEqual(ErrorCategory.NETWORK);
      expect(lookupError(19100002).category).assertEqual(ErrorCategory.ACCOUNT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0018
     * @tc.name      testReportCodePrecision0018
     * @tc.desc      reports format negative codes as all ones
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportCodePrecision0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatErrorReport(new ErrorReport(-1, '', '', 0), true).indexOf('code=0xFFFFFFFF') === 0)
        .assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0019
     * @tc.name      testParseDecimalLoop0019
     * @tc.desc      decimal codes parse back to their values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDecimalLoop0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let index = 0; index < CODES.length; index++) {
        expect(parseErrorCode(CODES[index].toString())).assertEqual(CODES[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0020
     * @tc.name      testReportCategoryText0020
     * @tc.desc      reports contain readable category text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportCategoryText0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const text: string = formatErrorReport(new ErrorReport(13900012, '', '', 0), true);
      expect(text.indexOf('category=permission_denied') > 0).assertTrue();
    })
  });
}
