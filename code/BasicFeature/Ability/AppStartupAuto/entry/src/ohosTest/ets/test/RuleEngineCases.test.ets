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
import { loggedIt as it } from '../support/TestLog';
import {
  ERROR_CATALOG, ErrorEntry, ErrorOwner, RetryAdvice, allowsAutoRetry, describeError,
  groupByOwner, isUnsupportedCode, logLineOf, needsSettingsForError, requiresUserActionFirst,
  tallyCodes, userMessageOf
} from '../../../main/ets/autostart/rules/ErrorCatalog';
import { QueryPhase } from '../../../main/ets/autostart/AutoStartupTypes';

function checkCatalogEntry(code: string): void {
  const entry: ErrorEntry = describeError(code);
  expect(entry.code).assertEqual(code);
  expect(entry.name.length > 0).assertTrue();
  expect(entry.message.length > 0).assertTrue();
  expect(entry.hint.length > 0).assertTrue();
  expect(isUnsupportedCode(code)).assertEqual(entry.unsupported);
  expect(needsSettingsForError(code)).assertEqual(entry.settingsGuidance);
  expect((entry.owner as string).length > 0).assertTrue();
  expect((entry.retry as string).length > 0).assertTrue();
  expect(userMessageOf(code).length > 0).assertEqual(code !== '0');
  expect(logLineOf(code, 'detail').indexOf(code) >= 0).assertTrue();
}

export default function ruleEngineCasesTest(): void {
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
      checkCatalogEntry('0');
      expect(describeError('0').name).assertEqual('OK');
      expect(describeError('0').unsupported).assertFalse();
      expect(describeError('0').settingsGuidance).assertFalse();
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
      checkCatalogEntry('201');
      expect(describeError('201').name).assertEqual('PERMISSION_DENIED');
      expect(needsSettingsForError('201')).assertTrue();
      expect(isUnsupportedCode('201')).assertFalse();
      expect(describeError('201').owner).assertEqual(ErrorOwner.USER);
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
      checkCatalogEntry('202');
      expect(isUnsupportedCode('202')).assertTrue();
      expect(needsSettingsForError('202')).assertFalse();
      expect(describeError('202').owner).assertEqual(ErrorOwner.SYSTEM);
      expect(describeError('202').unsupported).assertTrue();
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
      checkCatalogEntry('401');
      expect(describeError('401').name).assertEqual('PARAMETER_ERROR');
      expect(isUnsupportedCode('401')).assertFalse();
      expect(needsSettingsForError('401')).assertFalse();
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
      checkCatalogEntry('801');
      expect(describeError('801').name).assertEqual('CAPABILITY_NOT_SUPPORTED');
      expect(isUnsupportedCode('801')).assertTrue();
      expect(describeError('801').retry).assertEqual(RetryAdvice.NO_RETRY);
      expect(requiresUserActionFirst('801')).assertFalse();
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
      checkCatalogEntry('16000001');
      expect(describeError('16000001').name).assertEqual('INVALID_PARAMETER');
      expect(describeError('16000001').owner).assertEqual(ErrorOwner.APP);
      expect(userMessageOf('16000001').length > 0).assertTrue();
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
      checkCatalogEntry('16000011');
      expect(describeError('16000011').name).assertEqual('CONTEXT_INVALID');
      expect(isUnsupportedCode('16000011')).assertFalse();
      expect(userMessageOf('16000011').length > 0).assertTrue();
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
      checkCatalogEntry('16000050');
      expect(describeError('16000050').name).assertEqual('INTERNAL_ERROR');
      expect(describeError('16000050').owner).assertEqual(ErrorOwner.SYSTEM);
      expect(userMessageOf('16000050').length > 0).assertTrue();
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
      checkCatalogEntry('16000053');
      expect(describeError('16000053').name).assertEqual('NOT_TOP_ABILITY');
      expect(describeError('16000053').owner).assertEqual(ErrorOwner.APP);
      expect(userMessageOf('16000053').length > 0).assertTrue();
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
      checkCatalogEntry('16000060');
      expect(describeError('16000060').name).assertEqual('ABILITY_NOT_FOUND');
      expect(isUnsupportedCode('16000060')).assertTrue();
      expect(describeError('16000060').retry).assertEqual(RetryAdvice.NO_RETRY);
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
      checkCatalogEntry('401001');
      expect(describeError('401001').name).assertEqual('TEXT_TOO_LONG');
      expect(describeError('401001').retry).assertEqual(RetryAdvice.NO_RETRY);
      expect(userMessageOf('401001').length > 0).assertTrue();
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
      checkCatalogEntry('401002');
      expect(describeError('401002').name).assertEqual('FIELD_EMPTY');
      expect(describeError('401002').unsupported).assertFalse();
      expect(userMessageOf('401002').length > 0).assertTrue();
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
      checkCatalogEntry('STORAGE_READ');
      expect(describeError('STORAGE_READ').name).assertEqual('STORAGE_READ_FAILED');
      expect(describeError('STORAGE_READ').retry).assertEqual(RetryAdvice.RETRY_AFTER_ACTION);
      expect(isUnsupportedCode('STORAGE_READ')).assertFalse();
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
      checkCatalogEntry('STORAGE_WRITE');
      expect(describeError('STORAGE_WRITE').name).assertEqual('STORAGE_WRITE_FAILED');
      expect(describeError('STORAGE_WRITE').retry).assertEqual(RetryAdvice.RETRY_LATER);
      expect(userMessageOf('STORAGE_WRITE').length > 0).assertTrue();
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
      checkCatalogEntry('TIMEOUT');
      expect(describeError('TIMEOUT').name).assertEqual('QUERY_TIMEOUT');
      expect(describeError('TIMEOUT').owner).assertEqual(ErrorOwner.ENVIRONMENT);
      expect(isUnsupportedCode('TIMEOUT')).assertFalse();
      expect(describeError('TIMEOUT').retry).assertEqual(RetryAdvice.RETRY_LATER);
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
      checkCatalogEntry('UNKNOWN');
      expect(describeError('UNKNOWN').name).assertEqual('UNKNOWN');
      const fallback: ErrorEntry = describeError('999999999');
      expect(fallback.code).assertEqual('UNKNOWN');
      expect(fallback.name).assertEqual('UNKNOWN');
      expect(describeError('').code).assertEqual('UNKNOWN');
      expect(describeError('  801  ').code).assertEqual('801');
      expect(describeError('storage_read').code).assertEqual('STORAGE_READ');
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
      expect(ERROR_CATALOG.length).assertEqual(16);
      const seen: string[] = [];
      ERROR_CATALOG.forEach((entry: ErrorEntry): void => {
        expect(seen.indexOf(entry.code) < 0).assertTrue();
        seen.push(entry.code);
        expect(entry.code.length > 0).assertTrue();
        expect(entry.name.length > 0).assertTrue();
        expect(entry.message.length > 0).assertTrue();
        expect(entry.hint.length > 0).assertTrue();
      });
      expect(seen.length).assertEqual(16);
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
      const tally = tallyCodes(['801', '201', 'TIMEOUT', 'UNKNOWN', '801']);
      expect(tally.unsupported).assertEqual(2);
      expect(tally.timeout).assertEqual(1);
      expect(tally.unknown).assertEqual(1);
      expect(tally.total()).assertEqual(5);
      expect(tally.summary().indexOf('不支持 2') > 0).assertTrue();
      expect(tallyCodes([]).total()).assertEqual(0);
      expect(tallyCodes(['0']).succeeded).assertEqual(1);
      const grouped = groupByOwner(['801', '202', 'UNKNOWN']);
      expect(grouped.get(ErrorOwner.SYSTEM)?.length).assertEqual(2);
      expect(grouped.get(ErrorOwner.APP)?.length).assertEqual(1);
      expect(groupByOwner([]).size).assertEqual(4);
      expect(groupByOwner([]).get(ErrorOwner.USER)?.length).assertEqual(0);
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
      expect(requiresUserActionFirst('201')).assertTrue();
      expect(requiresUserActionFirst('TIMEOUT')).assertFalse();
      expect(requiresUserActionFirst('801')).assertFalse();
      expect(allowsAutoRetry('801')).assertFalse();
      expect(allowsAutoRetry('TIMEOUT')).assertTrue();
      expect(allowsAutoRetry('STORAGE_WRITE')).assertTrue();
      expect(allowsAutoRetry('UNKNOWN')).assertTrue();
      expect(allowsAutoRetry('202')).assertFalse();
    });
  });
}
