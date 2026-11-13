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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  ERROR_CATALOG, ErrorEntry, ErrorOwner, RetryAdvice, allowsAutoRetry, describeError,
  groupByOwner, isUnsupportedCode, logLineOf, needsSettingsForError, requiresUserActionFirst,
  tallyCodes, userMessageOf
} from '../../../main/ets/autostart/rules/ErrorCatalog';
import { QueryPhase } from '../../../main/ets/autostart/AutoStartupTypes';

function checkCatalogEntry(code: string): void {
  const entry: ErrorEntry = describeError(code);
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0001|assertEqual|actual', entry.code)).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0001|assertEqual|expected', code));
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0002|assertTrue|actual|expected=true', entry.name.length > 0)).assertTrue();
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0003|assertTrue|actual|expected=true', entry.message.length > 0)).assertTrue();
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0004|assertTrue|actual|expected=true', entry.hint.length > 0)).assertTrue();
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0005|assertEqual|actual', isUnsupportedCode(code))).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0005|assertEqual|expected', entry.unsupported));
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0006|assertEqual|actual', needsSettingsForError(code))).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0006|assertEqual|expected', entry.settingsGuidance));
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0007|assertTrue|actual|expected=true', (entry.owner as string).length > 0)).assertTrue();
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0008|assertTrue|actual|expected=true', (entry.retry as string).length > 0)).assertTrue();
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0009|assertEqual|actual', userMessageOf(code).length > 0)).assertEqual(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0009|assertEqual|expected', code !== '0'));
  expect(traceParameter('com.samples.appstartupauto_SharedAssertion_0000|RuleEngineCases.test.ets|assert0010|assertTrue|actual|expected=true', logLineOf(code, 'detail').indexOf(code) >= 0)).assertTrue();
}

export default function ruleEngineCasesTest(): void {
  configureTestText();
  describe('ErrorCatalogCodeCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0100
     * @tc.name      testErrorCatalogCodeCases0001
     * @tc.desc      Verify code0 is success entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0001', 0, (): void => {
      configureTestText();
      checkCatalogEntry('0');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0001|RuleEngineCases.test.ets|assert0011|assertEqual|actual', describeError('0').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0001|RuleEngineCases.test.ets|assert0011|assertEqual|expected', 'OK'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0001|RuleEngineCases.test.ets|assert0012|assertFalse|actual|expected=false', describeError('0').unsupported)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0001|RuleEngineCases.test.ets|assert0013|assertFalse|actual|expected=false', describeError('0').settingsGuidance)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0200
     * @tc.name      testErrorCatalogCodeCases0002
     * @tc.desc      Verify code201 is permission denied
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0002', 0, (): void => {
      configureTestText();
      checkCatalogEntry('201');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0002|RuleEngineCases.test.ets|assert0014|assertEqual|actual', describeError('201').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0002|RuleEngineCases.test.ets|assert0014|assertEqual|expected', 'PERMISSION_DENIED'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0002|RuleEngineCases.test.ets|assert0015|assertTrue|actual|expected=true', needsSettingsForError('201'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0002|RuleEngineCases.test.ets|assert0016|assertFalse|actual|expected=false', isUnsupportedCode('201'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0002|RuleEngineCases.test.ets|assert0017|assertEqual|actual', describeError('201').owner)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0002|RuleEngineCases.test.ets|assert0017|assertEqual|expected', ErrorOwner.USER));
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0300
     * @tc.name      testErrorCatalogCodeCases0003
     * @tc.desc      Verify code202 is not system app
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0003', 0, (): void => {
      configureTestText();
      checkCatalogEntry('202');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0003|RuleEngineCases.test.ets|assert0018|assertTrue|actual|expected=true', isUnsupportedCode('202'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0003|RuleEngineCases.test.ets|assert0019|assertFalse|actual|expected=false', needsSettingsForError('202'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0003|RuleEngineCases.test.ets|assert0020|assertEqual|actual', describeError('202').owner)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0003|RuleEngineCases.test.ets|assert0020|assertEqual|expected', ErrorOwner.SYSTEM));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0003|RuleEngineCases.test.ets|assert0021|assertTrue|actual|expected=true', describeError('202').unsupported)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0400
     * @tc.name      testErrorCatalogCodeCases0004
     * @tc.desc      Verify code401 is parameter error
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0004', 0, (): void => {
      configureTestText();
      checkCatalogEntry('401');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0004|RuleEngineCases.test.ets|assert0022|assertEqual|actual', describeError('401').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0004|RuleEngineCases.test.ets|assert0022|assertEqual|expected', 'PARAMETER_ERROR'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0004|RuleEngineCases.test.ets|assert0023|assertFalse|actual|expected=false', isUnsupportedCode('401'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0004|RuleEngineCases.test.ets|assert0024|assertFalse|actual|expected=false', needsSettingsForError('401'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0500
     * @tc.name      testErrorCatalogCodeCases0005
     * @tc.desc      Verify code801 is capability not supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0005', 0, (): void => {
      configureTestText();
      checkCatalogEntry('801');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0005|RuleEngineCases.test.ets|assert0025|assertEqual|actual', describeError('801').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0005|RuleEngineCases.test.ets|assert0025|assertEqual|expected', 'CAPABILITY_NOT_SUPPORTED'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0005|RuleEngineCases.test.ets|assert0026|assertTrue|actual|expected=true', isUnsupportedCode('801'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0005|RuleEngineCases.test.ets|assert0027|assertEqual|actual', describeError('801').retry)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0005|RuleEngineCases.test.ets|assert0027|assertEqual|expected', RetryAdvice.NO_RETRY));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0005|RuleEngineCases.test.ets|assert0028|assertFalse|actual|expected=false', requiresUserActionFirst('801'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0600
     * @tc.name      testErrorCatalogCodeCases0006
     * @tc.desc      Verify code16000001 is invalid parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0006', 0, (): void => {
      configureTestText();
      checkCatalogEntry('16000001');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0006|RuleEngineCases.test.ets|assert0029|assertEqual|actual', describeError('16000001').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0006|RuleEngineCases.test.ets|assert0029|assertEqual|expected', 'INVALID_PARAMETER'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0006|RuleEngineCases.test.ets|assert0030|assertEqual|actual', describeError('16000001').owner)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0006|RuleEngineCases.test.ets|assert0030|assertEqual|expected', ErrorOwner.APP));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0006|RuleEngineCases.test.ets|assert0031|assertTrue|actual|expected=true', userMessageOf('16000001').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0700
     * @tc.name      testErrorCatalogCodeCases0007
     * @tc.desc      Verify code16000011 is context invalid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0007', 0, (): void => {
      configureTestText();
      checkCatalogEntry('16000011');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0007|RuleEngineCases.test.ets|assert0032|assertEqual|actual', describeError('16000011').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0007|RuleEngineCases.test.ets|assert0032|assertEqual|expected', 'CONTEXT_INVALID'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0007|RuleEngineCases.test.ets|assert0033|assertFalse|actual|expected=false', isUnsupportedCode('16000011'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0007|RuleEngineCases.test.ets|assert0034|assertTrue|actual|expected=true', userMessageOf('16000011').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0800
     * @tc.name      testErrorCatalogCodeCases0008
     * @tc.desc      Verify code16000050 is internal error
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0008', 0, (): void => {
      configureTestText();
      checkCatalogEntry('16000050');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0008|RuleEngineCases.test.ets|assert0035|assertEqual|actual', describeError('16000050').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0008|RuleEngineCases.test.ets|assert0035|assertEqual|expected', 'INTERNAL_ERROR'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0008|RuleEngineCases.test.ets|assert0036|assertEqual|actual', describeError('16000050').owner)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0008|RuleEngineCases.test.ets|assert0036|assertEqual|expected', ErrorOwner.SYSTEM));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0008|RuleEngineCases.test.ets|assert0037|assertTrue|actual|expected=true', userMessageOf('16000050').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_0900
     * @tc.name      testErrorCatalogCodeCases0009
     * @tc.desc      Verify code16000053 is not top ability
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0009', 0, (): void => {
      configureTestText();
      checkCatalogEntry('16000053');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0009|RuleEngineCases.test.ets|assert0038|assertEqual|actual', describeError('16000053').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0009|RuleEngineCases.test.ets|assert0038|assertEqual|expected', 'NOT_TOP_ABILITY'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0009|RuleEngineCases.test.ets|assert0039|assertEqual|actual', describeError('16000053').owner)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0009|RuleEngineCases.test.ets|assert0039|assertEqual|expected', ErrorOwner.APP));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0009|RuleEngineCases.test.ets|assert0040|assertTrue|actual|expected=true', userMessageOf('16000053').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1000
     * @tc.name      testErrorCatalogCodeCases0010
     * @tc.desc      Verify code16000060 is ability not found
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0010', 0, (): void => {
      configureTestText();
      checkCatalogEntry('16000060');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0010|RuleEngineCases.test.ets|assert0041|assertEqual|actual', describeError('16000060').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0010|RuleEngineCases.test.ets|assert0041|assertEqual|expected', 'ABILITY_NOT_FOUND'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0010|RuleEngineCases.test.ets|assert0042|assertTrue|actual|expected=true', isUnsupportedCode('16000060'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0010|RuleEngineCases.test.ets|assert0043|assertEqual|actual', describeError('16000060').retry)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0010|RuleEngineCases.test.ets|assert0043|assertEqual|expected', RetryAdvice.NO_RETRY));
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1100
     * @tc.name      testErrorCatalogCodeCases0011
     * @tc.desc      Verify code401001 is text too long
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testErrorCatalogCodeCases0011', 0, (): void => {
      configureTestText();
      checkCatalogEntry('401001');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0011|RuleEngineCases.test.ets|assert0044|assertEqual|actual', describeError('401001').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0011|RuleEngineCases.test.ets|assert0044|assertEqual|expected', 'TEXT_TOO_LONG'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0011|RuleEngineCases.test.ets|assert0045|assertEqual|actual', describeError('401001').retry)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0011|RuleEngineCases.test.ets|assert0045|assertEqual|expected', RetryAdvice.NO_RETRY));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0011|RuleEngineCases.test.ets|assert0046|assertTrue|actual|expected=true', userMessageOf('401001').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1200
     * @tc.name      testErrorCatalogCodeCases0012
     * @tc.desc      Verify code401002 is field empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0012', 0, (): void => {
      configureTestText();
      checkCatalogEntry('401002');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0012|RuleEngineCases.test.ets|assert0047|assertEqual|actual', describeError('401002').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0012|RuleEngineCases.test.ets|assert0047|assertEqual|expected', 'FIELD_EMPTY'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0012|RuleEngineCases.test.ets|assert0048|assertFalse|actual|expected=false', describeError('401002').unsupported)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0012|RuleEngineCases.test.ets|assert0049|assertTrue|actual|expected=true', userMessageOf('401002').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1300
     * @tc.name      testErrorCatalogCodeCases0013
     * @tc.desc      Verify storage read failure is retryable after action
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0013', 0, (): void => {
      configureTestText();
      checkCatalogEntry('STORAGE_READ');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0013|RuleEngineCases.test.ets|assert0050|assertEqual|actual', describeError('STORAGE_READ').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0013|RuleEngineCases.test.ets|assert0050|assertEqual|expected', 'STORAGE_READ_FAILED'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0013|RuleEngineCases.test.ets|assert0051|assertEqual|actual', describeError('STORAGE_READ').retry)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0013|RuleEngineCases.test.ets|assert0051|assertEqual|expected', RetryAdvice.RETRY_AFTER_ACTION));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0013|RuleEngineCases.test.ets|assert0052|assertFalse|actual|expected=false', isUnsupportedCode('STORAGE_READ'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1400
     * @tc.name      testErrorCatalogCodeCases0014
     * @tc.desc      Verify storage write failure is retry later
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0014', 0, (): void => {
      configureTestText();
      checkCatalogEntry('STORAGE_WRITE');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0014|RuleEngineCases.test.ets|assert0053|assertEqual|actual', describeError('STORAGE_WRITE').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0014|RuleEngineCases.test.ets|assert0053|assertEqual|expected', 'STORAGE_WRITE_FAILED'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0014|RuleEngineCases.test.ets|assert0054|assertEqual|actual', describeError('STORAGE_WRITE').retry)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0014|RuleEngineCases.test.ets|assert0054|assertEqual|expected', RetryAdvice.RETRY_LATER));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0014|RuleEngineCases.test.ets|assert0055|assertTrue|actual|expected=true', userMessageOf('STORAGE_WRITE').length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1500
     * @tc.name      testErrorCatalogCodeCases0015
     * @tc.desc      Verify timeout is environment owned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0015', 0, (): void => {
      configureTestText();
      checkCatalogEntry('TIMEOUT');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0056|assertEqual|actual', describeError('TIMEOUT').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0056|assertEqual|expected', 'QUERY_TIMEOUT'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0057|assertEqual|actual', describeError('TIMEOUT').owner)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0057|assertEqual|expected', ErrorOwner.ENVIRONMENT));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0058|assertFalse|actual|expected=false', isUnsupportedCode('TIMEOUT'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0059|assertEqual|actual', describeError('TIMEOUT').retry)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0015|RuleEngineCases.test.ets|assert0059|assertEqual|expected', RetryAdvice.RETRY_LATER));
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1600
     * @tc.name      testErrorCatalogCodeCases0016
     * @tc.desc      Verify unknown code falls back to unknown entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0016', 0, (): void => {
      configureTestText();
      checkCatalogEntry('UNKNOWN');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0060|assertEqual|actual', describeError('UNKNOWN').name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0060|assertEqual|expected', 'UNKNOWN'));
      const fallback: ErrorEntry = describeError('999999999');
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0061|assertEqual|actual', fallback.code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0061|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0062|assertEqual|actual', fallback.name)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0062|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0063|assertEqual|actual', describeError('').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0063|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0064|assertEqual|actual', describeError('  801  ').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0064|assertEqual|expected', '801'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0065|assertEqual|actual', describeError('storage_read').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0016|RuleEngineCases.test.ets|assert0065|assertEqual|expected', 'STORAGE_READ'));
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1700
     * @tc.name      testErrorCatalogCodeCases0017
     * @tc.desc      Verify catalog is complete and unique
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testErrorCatalogCodeCases0017', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0066|assertEqual|actual', ERROR_CATALOG.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0066|assertEqual|expected', 16));
      const seen: string[] = [];
      ERROR_CATALOG.forEach((entry: ErrorEntry): void => {
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0067|assertTrue|actual|expected=true', seen.indexOf(entry.code) < 0)).assertTrue();
        seen.push(entry.code);
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0068|assertTrue|actual|expected=true', entry.code.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0069|assertTrue|actual|expected=true', entry.name.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0070|assertTrue|actual|expected=true', entry.message.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0071|assertTrue|actual|expected=true', entry.hint.length > 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0072|assertEqual|actual', seen.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0017|RuleEngineCases.test.ets|assert0072|assertEqual|expected', 16));
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1800
     * @tc.name      testErrorCatalogCodeCases0018
     * @tc.desc      Verify tally separates outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogCodeCases0018', 0, (): void => {
      configureTestText();
      const tally = tallyCodes(['801', '201', 'TIMEOUT', 'UNKNOWN', '801']);
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0073|assertEqual|actual', tally.unsupported)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0073|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0074|assertEqual|actual', tally.timeout)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0074|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0075|assertEqual|actual', tally.unknown)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0075|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0076|assertEqual|actual', tally.total())).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0076|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0077|assertTrue|actual|expected=true', tally.summary().indexOf('不支持 2') > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0078|assertEqual|actual', tallyCodes([]).total())).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0078|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0079|assertEqual|actual', tallyCodes(['0']).succeeded)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0079|assertEqual|expected', 1));
      const grouped = groupByOwner(['801', '202', 'UNKNOWN']);
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0080|assertEqual|actual', grouped.get(ErrorOwner.SYSTEM)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0080|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0081|assertEqual|actual', grouped.get(ErrorOwner.APP)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0081|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0082|assertEqual|actual', groupByOwner([]).size)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0082|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0083|assertEqual|actual', groupByOwner([]).get(ErrorOwner.USER)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0018|RuleEngineCases.test.ets|assert0083|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGCODECASES_1900
     * @tc.name      testErrorCatalogCodeCases0019
     * @tc.desc      Verify retry advice helpers follow the catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testErrorCatalogCodeCases0019', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0084|assertTrue|actual|expected=true', requiresUserActionFirst('201'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0085|assertFalse|actual|expected=false', requiresUserActionFirst('TIMEOUT'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0086|assertFalse|actual|expected=false', requiresUserActionFirst('801'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0087|assertFalse|actual|expected=false', allowsAutoRetry('801'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0088|assertTrue|actual|expected=true', allowsAutoRetry('TIMEOUT'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0089|assertTrue|actual|expected=true', allowsAutoRetry('STORAGE_WRITE'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0090|assertTrue|actual|expected=true', allowsAutoRetry('UNKNOWN'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogCodeCases_0019|RuleEngineCases.test.ets|assert0091|assertFalse|actual|expected=false', allowsAutoRetry('202'))).assertFalse();
    });
  });
}
