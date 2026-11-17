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
import { ErrorCategory, ErrorSeverity, ErrorInfo, ErrorReport, normalizeCode, isSuccess, parseErrorCode,
  formatCode, lookupError, categoryOf, severityOf, isRetryable, describeError, hintOf, formatErrorReport
} from '../main/ets/core/ErrorCodeCore';

const NOT_FOUND: number = 13900002;
const EACCES: number = 13900012;
const ENOSPC: number = 13900025;
const SAMPLE_SEC: number = 1700000000;

export default function errorCodeCoreTest(): void {
  describe('ErrorCodeCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0001
     * @tc.name      testNormalizeZero0001
     * @tc.desc      zero stays zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeZero0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeZero0001 begin');
      console.info('testNormalizeZero0001 begin');
      expect(normalizeCode(0)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0002
     * @tc.name      testNormalizeFloor0002
     * @tc.desc      fractional codes are floored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeFloor0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeFloor0002 begin');
      console.info('testNormalizeFloor0002 begin');
      expect(normalizeCode(5.9)).assertEqual(5);
      expect(normalizeCode(-3.2)).assertEqual(-4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0003
     * @tc.name      testNormalizeInvalid0003
     * @tc.desc      non finite codes normalize to minus one
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeInvalid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeInvalid0003 begin');
      console.info('testNormalizeInvalid0003 begin');
      expect(normalizeCode(Number.NaN)).assertEqual(-1);
      expect(normalizeCode(Number.POSITIVE_INFINITY)).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0004
     * @tc.name      testSuccess0004
     * @tc.desc      zero is success
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuccess0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuccess0004 begin');
      console.info('testSuccess0004 begin');
      expect(isSuccess(0)).assertTrue();
      expect(isSuccess(0.4)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0005
     * @tc.name      testSuccessFalse0005
     * @tc.desc      non zero codes are not success
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuccessFalse0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuccessFalse0005 begin');
      console.info('testSuccessFalse0005 begin');
      expect(isSuccess(1)).assertFalse();
      expect(isSuccess(-1)).assertFalse();
      expect(isSuccess(Number.NaN)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0006
     * @tc.name      testParseDecimal0006
     * @tc.desc      decimal text parses to its numeric value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseDecimal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseDecimal0006 begin');
      console.info('testParseDecimal0006 begin');
      expect(parseErrorCode('0')).assertEqual(0);
      expect(parseErrorCode('13900002')).assertEqual(NOT_FOUND);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0007
     * @tc.name      testParseTrim0007
     * @tc.desc      surrounding whitespace is ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTrim0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseTrim0007 begin');
      console.info('testParseTrim0007 begin');
      expect(parseErrorCode(' 13900002 ')).assertEqual(NOT_FOUND);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0008
     * @tc.name      testParseHex0008
     * @tc.desc      hexadecimal text with prefix is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseHex0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseHex0008 begin');
      console.info('testParseHex0008 begin');
      expect(parseErrorCode('0x10')).assertEqual(16);
      expect(parseErrorCode('0X10')).assertEqual(16);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0009
     * @tc.name      testParseHexUpper0009
     * @tc.desc      uppercase hex digits are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseHexUpper0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseHexUpper0009 begin');
      console.info('testParseHexUpper0009 begin');
      expect(parseErrorCode('0xD418E2')).assertEqual(NOT_FOUND);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0010
     * @tc.name      testParseEmpty0010
     * @tc.desc      empty text is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0010 begin');
      console.info('testParseEmpty0010 begin');
      expect(parseErrorCode('')).assertEqual(-1);
      expect(parseErrorCode('   ')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0011
     * @tc.name      testParseLetters0011
     * @tc.desc      non numeric text is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseLetters0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseLetters0011 begin');
      console.info('testParseLetters0011 begin');
      expect(parseErrorCode('abc')).assertEqual(-1);
      expect(parseErrorCode('12abc')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0012
     * @tc.name      testParseLeadingZero0012
     * @tc.desc      redundant leading zeros are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseLeadingZero0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseLeadingZero0012 begin');
      console.info('testParseLeadingZero0012 begin');
      expect(parseErrorCode('01')).assertEqual(-1);
      expect(parseErrorCode('00000001')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0013
     * @tc.name      testParseFraction0013
     * @tc.desc      fractional text is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFraction0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFraction0013 begin');
      console.info('testParseFraction0013 begin');
      expect(parseErrorCode('1.5')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0014
     * @tc.name      testParseEmptyHex0014
     * @tc.desc      empty hex body is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyHex0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmptyHex0014 begin');
      console.info('testParseEmptyHex0014 begin');
      expect(parseErrorCode('0x')).assertEqual(-1);
      expect(parseErrorCode('0xZZ')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0015
     * @tc.name      testParseNegative0015
     * @tc.desc      signed text keeps its numeric value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNegative0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNegative0015 begin');
      console.info('testParseNegative0015 begin');
      expect(parseErrorCode('-5')).assertEqual(-5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0016
     * @tc.name      testFormatZero0016
     * @tc.desc      zero formats as eight hex digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatZero0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatZero0016 begin');
      console.info('testFormatZero0016 begin');
      expect(formatCode(0)).assertEqual('0x00000000');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0017
     * @tc.name      testFormatOne0017
     * @tc.desc      small codes are zero padded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatOne0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatOne0017 begin');
      console.info('testFormatOne0017 begin');
      expect(formatCode(1)).assertEqual('0x00000001');
      expect(formatCode(15)).assertEqual('0x0000000F');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0018
     * @tc.name      testFormatByte0018
     * @tc.desc      byte sized codes format correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatByte0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatByte0018 begin');
      console.info('testFormatByte0018 begin');
      expect(formatCode(255)).assertEqual('0x000000FF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0019
     * @tc.name      testFormatNegative0019
     * @tc.desc      negative codes format as all ones
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatNegative0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatNegative0019 begin');
      console.info('testFormatNegative0019 begin');
      expect(formatCode(-1)).assertEqual('0xFFFFFFFF');
      expect(formatCode(Number.NaN)).assertEqual('0xFFFFFFFF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0020
     * @tc.name      testFormatSystemCode0020
     * @tc.desc      file system error codes format as expected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSystemCode0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSystemCode0020 begin');
      console.info('testFormatSystemCode0020 begin');
      expect(formatCode(NOT_FOUND)).assertEqual('0x00D418E2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0021
     * @tc.name      testLookupSuccess0021
     * @tc.desc      zero maps to the success entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupSuccess0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupSuccess0021 begin');
      console.info('testLookupSuccess0021 begin');
      const info: ErrorInfo = lookupError(0);
      expect(info.category).assertEqual(ErrorCategory.NONE);
      expect(info.severity).assertEqual(ErrorSeverity.INFO);
      expect(info.retryable).assertFalse();
      expect(info.message).assertEqual('操作成功');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0022
     * @tc.name      testLookupNotFound0022
     * @tc.desc      missing file code maps to file not found
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupNotFound0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupNotFound0022 begin');
      console.info('testLookupNotFound0022 begin');
      const info: ErrorInfo = lookupError(NOT_FOUND);
      expect(info.category).assertEqual(ErrorCategory.FILE_NOT_FOUND);
      expect(info.severity).assertEqual(ErrorSeverity.ERROR);
      expect(info.code).assertEqual(NOT_FOUND);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0023
     * @tc.name      testLookupPermission0023
     * @tc.desc      permission errors map to permission denied
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupPermission0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupPermission0023 begin');
      console.info('testLookupPermission0023 begin');
      expect(lookupError(13900001).category).assertEqual(ErrorCategory.PERMISSION_DENIED);
      expect(lookupError(EACCES).category).assertEqual(ErrorCategory.PERMISSION_DENIED);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0024
     * @tc.name      testLookupInterrupted0024
     * @tc.desc      interrupted calls are retryable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupInterrupted0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupInterrupted0024 begin');
      console.info('testLookupInterrupted0024 begin');
      const info: ErrorInfo = lookupError(13900004);
      expect(info.category).assertEqual(ErrorCategory.INTERNAL);
      expect(info.severity).assertEqual(ErrorSeverity.WARNING);
      expect(info.retryable).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0025
     * @tc.name      testLookupIo0025
     * @tc.desc      io errors are retryable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupIo0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupIo0025 begin');
      console.info('testLookupIo0025 begin');
      expect(lookupError(13900005).retryable).assertTrue();
      expect(lookupError(13900011).retryable).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0026
     * @tc.name      testLookupBadHandle0026
     * @tc.desc      invalid handles map to internal errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupBadHandle0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupBadHandle0026 begin');
      console.info('testLookupBadHandle0026 begin');
      expect(lookupError(13900008).category).assertEqual(ErrorCategory.INTERNAL);
      expect(lookupError(13900008).retryable).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0027
     * @tc.name      testLookupBusy0027
     * @tc.desc      busy resources are retryable warnings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupBusy0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupBusy0027 begin');
      console.info('testLookupBusy0027 begin');
      expect(lookupError(13900015).severity).assertEqual(ErrorSeverity.WARNING);
      expect(lookupError(13900015).retryable).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0028
     * @tc.name      testLookupInvalidArg0028
     * @tc.desc      invalid argument codes are grouped together
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupInvalidArg0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupInvalidArg0028 begin');
      console.info('testLookupInvalidArg0028 begin');
      expect(lookupError(13900013).category).assertEqual(ErrorCategory.INVALID_ARGUMENT);
      expect(lookupError(13900020).category).assertEqual(ErrorCategory.INVALID_ARGUMENT);
      expect(lookupError(13900030).category).assertEqual(ErrorCategory.INVALID_ARGUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0029
     * @tc.name      testLookupNoSpace0029
     * @tc.desc      full storage maps to storage full
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupNoSpace0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupNoSpace0029 begin');
      console.info('testLookupNoSpace0029 begin');
      const info: ErrorInfo = lookupError(ENOSPC);
      expect(info.category).assertEqual(ErrorCategory.STORAGE_FULL);
      expect(info.hint.indexOf('清理') >= 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0030
     * @tc.name      testLookupTimeout0030
     * @tc.desc      timeouts map to network errors and are retryable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupTimeout0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupTimeout0030 begin');
      console.info('testLookupTimeout0030 begin');
      const info: ErrorInfo = lookupError(13900042);
      expect(info.category).assertEqual(ErrorCategory.NETWORK);
      expect(info.retryable).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0031
     * @tc.name      testLookupDlpPolicy0031
     * @tc.desc      dlp policy codes map to dlp policy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupDlpPolicy0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupDlpPolicy0031 begin');
      console.info('testLookupDlpPolicy0031 begin');
      expect(lookupError(19100001).category).assertEqual(ErrorCategory.DLP_POLICY);
      expect(lookupError(19100003).category).assertEqual(ErrorCategory.DLP_POLICY);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0032
     * @tc.name      testLookupAccount0032
     * @tc.desc      account codes map to account errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupAccount0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupAccount0032 begin');
      console.info('testLookupAccount0032 begin');
      expect(lookupError(19100002).category).assertEqual(ErrorCategory.ACCOUNT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0033
     * @tc.name      testLookupDlpPermission0033
     * @tc.desc      dlp permission codes map to permission denied
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupDlpPermission0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupDlpPermission0033 begin');
      console.info('testLookupDlpPermission0033 begin');
      expect(lookupError(19100004).category).assertEqual(ErrorCategory.PERMISSION_DENIED);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0034
     * @tc.name      testLookupUnknown0034
     * @tc.desc      unmapped codes are unknown errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupUnknown0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupUnknown0034 begin');
      console.info('testLookupUnknown0034 begin');
      const info: ErrorInfo = lookupError(999);
      expect(info.category).assertEqual(ErrorCategory.UNKNOWN);
      expect(info.retryable).assertFalse();
      expect(info.hint.length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0035
     * @tc.name      testLookupUnmappedSystem0035
     * @tc.desc      unmapped system codes fall through to unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupUnmappedSystem0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupUnmappedSystem0035 begin');
      console.info('testLookupUnmappedSystem0035 begin');
      expect(lookupError(13900003).category).assertEqual(ErrorCategory.UNKNOWN);
      expect(lookupError(19100005).category).assertEqual(ErrorCategory.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0036
     * @tc.name      testLookupNegative0036
     * @tc.desc      negative codes are unknown errors
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupNegative0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupNegative0036 begin');
      console.info('testLookupNegative0036 begin');
      expect(lookupError(-1).category).assertEqual(ErrorCategory.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0037
     * @tc.name      testLookupFraction0037
     * @tc.desc      fractional codes are normalized before lookup
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLookupFraction0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLookupFraction0037 begin');
      console.info('testLookupFraction0037 begin');
      expect(lookupError(NOT_FOUND + 0.9).category).assertEqual(ErrorCategory.FILE_NOT_FOUND);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0038
     * @tc.name      testCategoryHelper0038
     * @tc.desc      category helper matches the lookup result
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryHelper0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryHelper0038 begin');
      console.info('testCategoryHelper0038 begin');
      expect(categoryOf(0)).assertEqual(ErrorCategory.NONE);
      expect(categoryOf(NOT_FOUND)).assertEqual(ErrorCategory.FILE_NOT_FOUND);
      expect(categoryOf(ENOSPC)).assertEqual(ErrorCategory.STORAGE_FULL);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0039
     * @tc.name      testSeverityHelper0039
     * @tc.desc      severity helper matches the lookup result
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSeverityHelper0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSeverityHelper0039 begin');
      console.info('testSeverityHelper0039 begin');
      expect(severityOf(0)).assertEqual(ErrorSeverity.INFO);
      expect(severityOf(NOT_FOUND)).assertEqual(ErrorSeverity.ERROR);
      expect(severityOf(13900004)).assertEqual(ErrorSeverity.WARNING);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0040
     * @tc.name      testRetryableHelper0040
     * @tc.desc      retryable helper reflects the code class
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableHelper0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRetryableHelper0040 begin');
      console.info('testRetryableHelper0040 begin');
      expect(isRetryable(0)).assertFalse();
      expect(isRetryable(NOT_FOUND)).assertFalse();
      expect(isRetryable(13900004)).assertTrue();
      expect(isRetryable(13900042)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0041
     * @tc.name      testDescribeSuccess0041
     * @tc.desc      success message is returned for zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeSuccess0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeSuccess0041 begin');
      console.info('testDescribeSuccess0041 begin');
      expect(describeError(0)).assertEqual('操作成功');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0042
     * @tc.name      testDescribeFile0042
     * @tc.desc      file errors have chinese messages
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeFile0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeFile0042 begin');
      console.info('testDescribeFile0042 begin');
      expect(describeError(NOT_FOUND)).assertEqual('文件不存在');
      expect(describeError(EACCES)).assertEqual('没有文件访问权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0043
     * @tc.name      testDescribeUnknown0043
     * @tc.desc      unknown codes use the fallback message
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeUnknown0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeUnknown0043 begin');
      console.info('testDescribeUnknown0043 begin');
      expect(describeError(999)).assertEqual('未知错误');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0044
     * @tc.name      testHintSuccess0044
     * @tc.desc      success has no hint
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintSuccess0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHintSuccess0044 begin');
      console.info('testHintSuccess0044 begin');
      expect(hintOf(0)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0045
     * @tc.name      testHintError0045
     * @tc.desc      error hints are provided
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintError0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHintError0045 begin');
      console.info('testHintError0045 begin');
      expect(hintOf(NOT_FOUND).length > 0).assertTrue();
      expect(hintOf(999).length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0046
     * @tc.name      testInfoFields0046
     * @tc.desc      error info keeps the normalized code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInfoFields0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testInfoFields0046 begin');
      console.info('testInfoFields0046 begin');
      const info: ErrorInfo = lookupError(NOT_FOUND);
      expect(info.code).assertEqual(NOT_FOUND);
      expect(info.message.length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0047
     * @tc.name      testReportFields0047
     * @tc.desc      error report keeps constructor fields
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportFields0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportFields0047 begin');
      console.info('testReportFields0047 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, 'open', 'detail', SAMPLE_SEC);
      expect(report.code).assertEqual(NOT_FOUND);
      expect(report.operation).assertEqual('open');
      expect(report.detail).assertEqual('detail');
      expect(report.occurredAtSec).assertEqual(SAMPLE_SEC);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0048
     * @tc.name      testReportFull0048
     * @tc.desc      full report formats every section
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportFull0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportFull0048 begin');
      console.info('testReportFull0048 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, 'open', 'open failed', SAMPLE_SEC);
      expect(formatErrorReport(report, true)).assertEqual(
        'code=0x00D418E2, category=file_not_found, severity=error, operation=open, ' +
        'time=2023/11/14 22:13:20, detail=open failed');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0049
     * @tc.name      testReportNoOperation0049
     * @tc.desc      empty operation is omitted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNoOperation0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportNoOperation0049 begin');
      console.info('testReportNoOperation0049 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, '', 'detail', SAMPLE_SEC);
      expect(formatErrorReport(report, true).indexOf('operation=')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0050
     * @tc.name      testReportNoDetail0050
     * @tc.desc      empty detail is omitted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNoDetail0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportNoDetail0050 begin');
      console.info('testReportNoDetail0050 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, 'open', '', SAMPLE_SEC);
      expect(formatErrorReport(report, true).indexOf('detail=')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0051
     * @tc.name      testReportNoTime0051
     * @tc.desc      invalid time is omitted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNoTime0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportNoTime0051 begin');
      console.info('testReportNoTime0051 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, 'open', 'd', -1);
      expect(formatErrorReport(report, true).indexOf('time=')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0052
     * @tc.name      testReportSuccess0052
     * @tc.desc      success reports use the none category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportSuccess0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportSuccess0052 begin');
      console.info('testReportSuccess0052 begin');
      const report: ErrorReport = new ErrorReport(0, '', '', 0);
      expect(formatErrorReport(report, true)).assertEqual(
        'code=0x00000000, category=none, severity=info, time=1970/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0053
     * @tc.name      testReportUnknown0053
     * @tc.desc      unknown reports carry the unknown category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportUnknown0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportUnknown0053 begin');
      console.info('testReportUnknown0053 begin');
      const report: ErrorReport = new ErrorReport(999, '', '', 0);
      expect(formatErrorReport(report, true).indexOf('category=unknown') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0054
     * @tc.name      testReportNegative0054
     * @tc.desc      negative codes format as all ones in reports
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportNegative0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportNegative0054 begin');
      console.info('testReportNegative0054 begin');
      const report: ErrorReport = new ErrorReport(-1, '', '', 0);
      expect(formatErrorReport(report, true).indexOf('code=0xFFFFFFFF') === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0055
     * @tc.name      testReportCommaDetail0055
     * @tc.desc      commas inside details are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReportCommaDetail0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReportCommaDetail0055 begin');
      console.info('testReportCommaDetail0055 begin');
      const report: ErrorReport = new ErrorReport(NOT_FOUND, '', 'a, b', 0);
      expect(formatErrorReport(report, true).indexOf('detail=a, b') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0056
     * @tc.name      testParseFormatRoundTrip0056
     * @tc.desc      formatted codes parse back to the same value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseFormatRoundTrip0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseFormatRoundTrip0056 begin');
      console.info('testParseFormatRoundTrip0056 begin');
      expect(parseErrorCode(formatCode(NOT_FOUND))).assertEqual(NOT_FOUND);
      expect(parseErrorCode(formatCode(255))).assertEqual(255);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0057
     * @tc.name      testCategoryValues0057
     * @tc.desc      category enum uses stable string values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryValues0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryValues0057 begin');
      console.info('testCategoryValues0057 begin');
      expect(ErrorCategory.FILE_NOT_FOUND.toString()).assertEqual('file_not_found');
      expect(ErrorCategory.DLP_POLICY.toString()).assertEqual('dlp_policy');
      expect(ErrorCategory.STORAGE_FULL.toString()).assertEqual('storage_full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0058
     * @tc.name      testSeverityValues0058
     * @tc.desc      severity enum uses stable string values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSeverityValues0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSeverityValues0058 begin');
      console.info('testSeverityValues0058 begin');
      expect(ErrorSeverity.INFO.toString()).assertEqual('info');
      expect(ErrorSeverity.WARNING.toString()).assertEqual('warning');
      expect(ErrorSeverity.ERROR.toString()).assertEqual('error');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0059
     * @tc.name      testMessagesNonEmpty0059
     * @tc.desc      every mapped code has a message
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMessagesNonEmpty0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMessagesNonEmpty0059 begin');
      console.info('testMessagesNonEmpty0059 begin');
      const codes: number[] = [0, 13900001, NOT_FOUND, 13900004, 13900005, EACCES, 13900020, ENOSPC,
        13900042, 19100001, 19100002, 19100003, 19100004, 999];
      for (let index = 0; index < codes.length; index++) {
        expect(describeError(codes[index]).length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCODE_0060
     * @tc.name      testNonRetryableSet0060
     * @tc.desc      permanent errors are not retryable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNonRetryableSet0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNonRetryableSet0060 begin');
      console.info('testNonRetryableSet0060 begin');
      const codes: number[] = [NOT_FOUND, EACCES, ENOSPC, 13900020, 19100001, 19100004];
      for (let index = 0; index < codes.length; index++) {
        expect(isRetryable(codes[index])).assertFalse();
      }
    })
  });
}
