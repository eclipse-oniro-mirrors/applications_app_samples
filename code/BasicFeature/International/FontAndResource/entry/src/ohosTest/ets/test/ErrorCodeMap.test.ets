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

// Import the error code registry and its explanation model through the library facade.
import { ErrorCodeMap, ErrorExplain } from 'library';
// Import hilog directly for device side case logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag shared by every case of this suite.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const CASE_PREFIX: string = 'FontAndResource_';

// The permission denied code registered as a hard error.
const CODE_PERMISSION: number = 201;
// The internal parameter check code registered as a hard error.
const CODE_INTERNAL: number = 202;
// The parameter type mismatch code registered as a warning.
const CODE_PARAM: number = 401;
// The font not found code registered as a warning.
const CODE_FONT_NOT_FOUND: number = 31100101;
// The font already installed code registered as info.
const CODE_FONT_INSTALLED: number = 31100104;
// The uninstall target not found code registered as a warning.
const CODE_UNINSTALL_MISS: number = 31100106;
// The internal font service failure code registered as a hard error.
const CODE_SERVICE_BROKEN: number = 31100110;
// The font service busy code registered as info.
const CODE_SERVICE_BUSY: number = 31100111;
// The unknown code used by the fallback matrix.
const CODE_UNKNOWN: number = 99999999;
// The second unknown code used to prove the fallback echoes any input.
const CODE_UNKNOWN_ALT: number = 12345678;

// The severity bucket name expected for hard errors.
const SEVERITY_ERROR: string = 'error';
// The severity bucket name expected for warnings.
const SEVERITY_WARNING: string = 'warning';
// The severity bucket name expected for informational entries.
const SEVERITY_INFO: string = 'info';

// Logs one structured case progress line into hilog under the case tag.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s', CASE_PREFIX + tag + ', ' + detail);
}

// Registers every logic test case of the ErrorCodeMap suite.
export default function errorCodeMapTest(): void {
  // Group the cases under the ErrorCodeMapSuite describe block.
  describe('ErrorCodeMapSuite', () => {
    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ERRCODE_0100
     * @tc.name      testErrCode0001
     * @tc.desc      Verify the system level codes 201 and 202 explain as error and the parameter code 401 explains as warning.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrCode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testErrCode0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Explain the permission denied code.
      const permissionSeverity: string = ErrorCodeMap.explain(CODE_PERMISSION).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_PERMISSION + ').severity: ' + permissionSeverity);
      // Expect the permission denied code to be a hard error.
      expect(permissionSeverity).assertEqual(SEVERITY_ERROR);

      // Explain the internal parameter check code.
      const internalSeverity: string = ErrorCodeMap.explain(CODE_INTERNAL).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_INTERNAL + ').severity: ' + internalSeverity);
      // Expect the internal parameter check code to be a hard error.
      expect(internalSeverity).assertEqual(SEVERITY_ERROR);

      // Explain the parameter type mismatch code.
      const paramSeverity: string = ErrorCodeMap.explain(CODE_PARAM).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_PARAM + ').severity: ' + paramSeverity);
      // Expect the parameter type mismatch code to be a warning.
      expect(paramSeverity).assertEqual(SEVERITY_WARNING);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ERRCODE_0200
     * @tc.name      testErrCode0002
     * @tc.desc      Verify the font subsystem codes 31100101 and 31100110 keep their warning and error buckets while 31100104 and 31100111 explain as info.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrCode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testErrCode0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Explain the font not found code.
      const notFoundSeverity: string = ErrorCodeMap.explain(CODE_FONT_NOT_FOUND).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_FONT_NOT_FOUND + ').severity: ' + notFoundSeverity);
      // Expect the font not found code to be a warning.
      expect(notFoundSeverity).assertEqual(SEVERITY_WARNING);

      // Explain the font already installed code.
      const installedSeverity: string = ErrorCodeMap.explain(CODE_FONT_INSTALLED).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_FONT_INSTALLED + ').severity: ' + installedSeverity);
      // Expect the font already installed code to be informational.
      expect(installedSeverity).assertEqual(SEVERITY_INFO);

      // Explain the font service busy code.
      const busySeverity: string = ErrorCodeMap.explain(CODE_SERVICE_BUSY).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_SERVICE_BUSY + ').severity: ' + busySeverity);
      // Expect the font service busy code to be informational.
      expect(busySeverity).assertEqual(SEVERITY_INFO);

      // Explain the internal font service failure code.
      const brokenSeverity: string = ErrorCodeMap.explain(CODE_SERVICE_BROKEN).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_SERVICE_BROKEN + ').severity: ' + brokenSeverity);
      // Expect the internal font service failure code to be a hard error.
      expect(brokenSeverity).assertEqual(SEVERITY_ERROR);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ERRCODE_0300
     * @tc.name      testErrCode0003
     * @tc.desc      Verify unknown codes fall back to a generic error entry whose code echoes the requested number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrCode0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testErrCode0003';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Explain the unknown code so the generic fallback runs.
      const unknown: ErrorExplain = ErrorCodeMap.explain(CODE_UNKNOWN);
      // Log the fallback severity and echoed code.
      logCase(TAG, 'explain(' + CODE_UNKNOWN + '): severity ' + unknown.severity + ', code ' + unknown.code);
      // Expect the unknown code fallback to be a hard error.
      expect(unknown.severity).assertEqual(SEVERITY_ERROR);
      // Expect the unknown code fallback to echo the requested number.
      expect(unknown.code).assertEqual(CODE_UNKNOWN);

      // Explain a second unknown code so the echo is proven for any input.
      const altUnknown: ErrorExplain = ErrorCodeMap.explain(CODE_UNKNOWN_ALT);
      // Log the second fallback severity and echoed code.
      logCase(TAG, 'explain(' + CODE_UNKNOWN_ALT + '): severity ' + altUnknown.severity + ', code ' + altUnknown.code);
      // Expect the second unknown code fallback to echo its requested number.
      expect(altUnknown.code).assertEqual(CODE_UNKNOWN_ALT);
      // Expect the second unknown code fallback to stay a hard error.
      expect(altUnknown.severity).assertEqual(SEVERITY_ERROR);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_ERRCODE_0400
     * @tc.name      testErrCode0004
     * @tc.desc      Verify known codes 201, 401 and 31100106 return entries whose code field echoes the requested input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrCode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // The per case hilog tag, identical to the it name.
      const TAG: string = 'testErrCode0004';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Explain the permission code and read back its code field.
      const permissionCode: number = ErrorCodeMap.explain(CODE_PERMISSION).code;
      // Log the echoed permission code.
      logCase(TAG, 'explain(' + CODE_PERMISSION + ').code: ' + permissionCode);
      // Expect the permission entry to echo the requested code.
      expect(permissionCode).assertEqual(CODE_PERMISSION);

      // Explain the parameter code and read back its code field.
      const paramCode: number = ErrorCodeMap.explain(CODE_PARAM).code;
      // Log the echoed parameter code.
      logCase(TAG, 'explain(' + CODE_PARAM + ').code: ' + paramCode);
      // Expect the parameter entry to echo the requested code.
      expect(paramCode).assertEqual(CODE_PARAM);

      // Explain the uninstall miss code and read back its code field.
      const uninstallCode: number = ErrorCodeMap.explain(CODE_UNINSTALL_MISS).code;
      // Log the echoed uninstall miss code.
      logCase(TAG, 'explain(' + CODE_UNINSTALL_MISS + ').code: ' + uninstallCode);
      // Expect the uninstall miss entry to echo the requested code.
      expect(uninstallCode).assertEqual(CODE_UNINSTALL_MISS);

      // Read the severity of the uninstall miss entry as a consistency probe.
      const uninstallSeverity: string = ErrorCodeMap.explain(CODE_UNINSTALL_MISS).severity;
      // Log the captured severity.
      logCase(TAG, 'explain(' + CODE_UNINSTALL_MISS + ').severity: ' + uninstallSeverity);
      // Expect the uninstall miss entry to stay a warning.
      expect(uninstallSeverity).assertEqual(SEVERITY_WARNING);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
