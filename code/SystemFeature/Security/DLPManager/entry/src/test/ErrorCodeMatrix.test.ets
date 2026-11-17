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
  formatErrorReport, hintOf, isRetryable, isSuccess, lookupError, normalizeCode, parseErrorCode,
  severityOf } from '../main/ets/core/ErrorCodeCore';

const NOT_FOUND: number = 13900002;
const NO_SPACE: number = 13900025;
const TIMEOUT: number = 13900042;
const SAMPLE_SEC: number = 1700000000;

export default function errorCodeMatrixTest(): void {
  describe('ErrorCodeMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0001
     * @tc.name      testLookupSuccess0001
     * @tc.desc      zero maps to the success entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupSuccess0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupSuccess0001 begin');
      const info: ErrorInfo = lookupError(0);
      expect(info.category).assertEqual(ErrorCategory.NONE);
      expect(info.severity).assertEqual(ErrorSeverity.INFO);
      expect(info.retryable).assertFalse();
      expect(info.hint).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0002
     * @tc.name      testLookupPermissionSweep0002
     * @tc.desc      permission codes share the same category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupPermissionSweep0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupPermissionSweep0002 begin');
      const codes: Array<number> = [13900001, 13900012, 19100004];
      for (let index = 0; index < codes.length; index++) {
        const info: ErrorInfo = lookupError(codes[index]);
        expect(info.category).assertEqual(ErrorCategory.PERMISSION_DENIED);
        expect(info.severity).assertEqual(ErrorSeverity.ERROR);
        expect(info.retryable).assertFalse();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0003
     * @tc.name      testLookupInvalidSweep0003
     * @tc.desc      invalid argument codes share the same category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupInvalidSweep0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupInvalidSweep0003 begin');
      const codes: Array<number> = [13900013, 13900019, 13900020, 13900030];
      for (let index = 0; index < codes.length; index++) {
        expect(lookupError(codes[index]).category).assertEqual(ErrorCategory.INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0004
     * @tc.name      testLookupInternalSweep0004
     * @tc.desc      internal codes map to the internal category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupInternalSweep0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupInternalSweep0004 begin');
      const codes: Array<number> = [13900004, 13900005, 13900008, 13900011, 13900015];
      for (let index = 0; index < codes.length; index++) {
        expect(lookupError(codes[index]).category).assertEqual(ErrorCategory.INTERNAL);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0005
     * @tc.name      testLookupStorage0005
     * @tc.desc      the no space code maps to storage full
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupStorage0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupStorage0005 begin');
      const info: ErrorInfo = lookupError(NO_SPACE);
      expect(info.category).assertEqual(ErrorCategory.STORAGE_FULL);
      expect(info.retryable).assertFalse();
      expect(info.hint.indexOf('清理') >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0006
     * @tc.name      testLookupTimeout0006
     * @tc.desc      timeouts map to network and are retryable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupTimeout0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupTimeout0006 begin');
      const info: ErrorInfo = lookupError(TIMEOUT);
      expect(info.category).assertEqual(ErrorCategory.NETWORK);
      expect(info.retryable).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0007
     * @tc.name      testLookupDlp0007
     * @tc.desc      dlp codes map to policy or permission categories
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupDlp0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupDlp0007 begin');
      expect(lookupError(19100001).category).assertEqual(ErrorCategory.DLP_POLICY);
      expect(lookupError(19100003).category).assertEqual(ErrorCategory.DLP_POLICY);
      expect(lookupError(19100004).category).assertEqual(ErrorCategory.PERMISSION_DENIED);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0008
     * @tc.name      testLookupAccount0008
     * @tc.desc      account codes map to account errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupAccount0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupAccount0008 begin');
      expect(lookupError(19100002).category).assertEqual(ErrorCategory.ACCOUNT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0009
     * @tc.name      testLookupUnknown0009
     * @tc.desc      unmapped codes fall back to unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupUnknown0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupUnknown0009 begin');
      expect(lookupError(999).category).assertEqual(ErrorCategory.UNKNOWN);
      expect(lookupError(13900003).category).assertEqual(ErrorCategory.UNKNOWN);
      expect(lookupError(-1).category).assertEqual(ErrorCategory.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0010
     * @tc.name      testNormalizeMatrix0010
     * @tc.desc      normalization floors and rejects non finite values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeMatrix0010 begin');
      expect(normalizeCode(5.9)).assertEqual(5);
      expect(normalizeCode(-3.2)).assertEqual(-4);
      expect(normalizeCode(Number.NaN)).assertEqual(-1);
      expect(normalizeCode(Number.POSITIVE_INFINITY)).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0011
     * @tc.name      testSuccessMatrix0011
     * @tc.desc      success detection uses the normalized code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuccessMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuccessMatrix0011 begin');
      expect(isSuccess(0)).assertTrue();
      expect(isSuccess(0.4)).assertTrue();
      expect(isSuccess(1)).assertFalse();
      expect(isSuccess(Number.NaN)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0012
     * @tc.name      testParseDecimal0012
     * @tc.desc      decimal codes parse to their values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDecimal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseDecimal0012 begin');
      expect(parseErrorCode('0')).assertEqual(0);
      expect(parseErrorCode('13900002')).assertEqual(NOT_FOUND);
      expect(parseErrorCode(' 13900025 ')).assertEqual(NO_SPACE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0013
     * @tc.name      testParseHex0013
     * @tc.desc      hexadecimal codes parse with and without case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseHex0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseHex0013 begin');
      expect(parseErrorCode('0x10')).assertEqual(16);
      expect(parseErrorCode('0X10')).assertEqual(16);
      expect(parseErrorCode('0xD418E2')).assertEqual(NOT_FOUND);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0014
     * @tc.name      testParseInvalid0014
     * @tc.desc      invalid code texts are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseInvalid0014 begin');
      expect(parseErrorCode('')).assertEqual(-1);
      expect(parseErrorCode('abc')).assertEqual(-1);
      expect(parseErrorCode('01')).assertEqual(-1);
      expect(parseErrorCode('1.5')).assertEqual(-1);
      expect(parseErrorCode('0x')).assertEqual(-1);
      expect(parseErrorCode('0xZZ')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0015
     * @tc.name      testParseNegative0015
     * @tc.desc      signed decimals keep their value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNegative0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNegative0015 begin');
      expect(parseErrorCode('-5')).assertEqual(-5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0016
     * @tc.name      testFormatSweep0016
     * @tc.desc      formatted codes are eight digit hex
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSweep0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSweep0016 begin');
      expect(formatCode(0)).assertEqual('0x00000000');
      expect(formatCode(1)).assertEqual('0x00000001');
      expect(formatCode(255)).assertEqual('0x000000FF');
      expect(formatCode(NOT_FOUND)).assertEqual('0x00D418E2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0017
     * @tc.name      testFormatInvalid0017
     * @tc.desc      negative and non finite codes format as all ones
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatInvalid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatInvalid0017 begin');
      expect(formatCode(-1)).assertEqual('0xFFFFFFFF');
      expect(formatCode(Number.NaN)).assertEqual('0xFFFFFFFF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0018
     * @tc.name      testParseFormatRoundTrip0018
     * @tc.desc      formatted codes parse back to their values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFormatRoundTrip0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFormatRoundTrip0018 begin');
      expect(parseErrorCode(formatCode(NO_SPACE))).assertEqual(NO_SPACE);
      expect(parseErrorCode(formatCode(255))).assertEqual(255);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0019
     * @tc.name      testCategoryHelper0019
     * @tc.desc      category helpers match lookups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryHelper0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryHelper0019 begin');
      expect(categoryOf(0)).assertEqual(ErrorCategory.NONE);
      expect(categoryOf(NOT_FOUND)).assertEqual(ErrorCategory.FILE_NOT_FOUND);
      expect(categoryOf(TIMEOUT)).assertEqual(ErrorCategory.NETWORK);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0020
     * @tc.name      testSeverityHelper0020
     * @tc.desc      severity helpers match lookups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSeverityHelper0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSeverityHelper0020 begin');
      expect(severityOf(0)).assertEqual(ErrorSeverity.INFO);
      expect(severityOf(13900004)).assertEqual(ErrorSeverity.WARNING);
      expect(severityOf(13900005)).assertEqual(ErrorSeverity.ERROR);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0021
     * @tc.name      testRetryableHelper0021
     * @tc.desc      retryable helpers match the code classes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableHelper0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRetryableHelper0021 begin');
      expect(isRetryable(13900004)).assertTrue();
      expect(isRetryable(13900011)).assertTrue();
      expect(isRetryable(13900015)).assertTrue();
      expect(isRetryable(TIMEOUT)).assertTrue();
      expect(isRetryable(NOT_FOUND)).assertFalse();
      expect(isRetryable(NO_SPACE)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0022
     * @tc.name      testDescribeMatrix0022
     * @tc.desc      descriptions cover success file and unknown codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeMatrix0022 begin');
      expect(describeError(0)).assertEqual('操作成功');
      expect(describeError(NOT_FOUND)).assertEqual('文件不存在');
      expect(describeError(13900012)).assertEqual('没有文件访问权限');
      expect(describeError(999)).assertEqual('未知错误');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0023
     * @tc.name      testHintMatrix0023
     * @tc.desc      hints are provided for errors and omitted for success
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHintMatrix0023 begin');
      expect(hintOf(0)).assertEqual('');
      expect(hintOf(NOT_FOUND).length > 0).assertTrue();
      expect(hintOf(999).length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0024
     * @tc.name      testReportFull0024
     * @tc.desc      full reports include every section
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportFull0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportFull0024 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, 'open', 'open failed', SAMPLE_SEC);
      expect(formatErrorReport(report, true)).assertEqual(
        'code=0x00D418E2, category=file_not_found, severity=error, operation=open, ' +
        'time=2023/11/14 22:13:20, detail=open failed');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0025
     * @tc.name      testReportOmissions0025
     * @tc.desc      empty and invalid sections are omitted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportOmissions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportOmissions0025 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, '', '', -1);
      const text: string = formatErrorReport(report, true);
      expect(text.indexOf('operation=')).assertEqual(-1);
      expect(text.indexOf('detail=')).assertEqual(-1);
      expect(text.indexOf('time=')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0026
     * @tc.name      testReportSuccess0026
     * @tc.desc      success reports use the none category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportSuccess0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportSuccess0026 begin');
      const report: ErrorReport = new ErrorReport(0, '', '', 0);
      expect(formatErrorReport(report, true)).assertEqual(
        'code=0x00000000, category=none, severity=info, time=1970/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0027
     * @tc.name      testReportComma0027
     * @tc.desc      commas inside details are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportComma0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportComma0027 begin');
      const report: ErrorReport = new ErrorReport(NO_SPACE, '', 'a, b', 0);
      expect(formatErrorReport(report, true).indexOf('detail=a, b') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX2_0028
     * @tc.name      testLookupFraction0028
     * @tc.desc      fractional codes are normalized before lookup
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupFraction0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupFraction0028 begin');
      expect(lookupError(NO_SPACE + 0.9).category).assertEqual(ErrorCategory.STORAGE_FULL);
    })
  });
}
