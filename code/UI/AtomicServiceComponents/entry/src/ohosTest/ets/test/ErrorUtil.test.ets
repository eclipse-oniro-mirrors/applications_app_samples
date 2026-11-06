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
 
import { describe, it, expect } from '@ohos/hypium';
import {
  ErrorInfo,
  errorInfo,
  formatError,
  pickerErrorHint
} from '../../../main/ets/utils/ErrorUtil';

export default function errorUtilTest() {
  describe('errorUtilTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0100
     * @tc.name errorInfoEmptyMessageFallback001
     * @tc.desc Verify ErrorInfo replaces an empty message with the unknown-error text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorInfo_emptyMessageFallback', 0, () => {
      const info = new ErrorInfo(0, '', 'hint');
      expect(info.message).assertEqual('Unknown error');
      expect(info.hint).assertEqual('hint');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0200
     * @tc.name errorInfoDescribePrefixesCode002
     * @tc.desc Verify describe prefixes positive codes and omits the prefix when there is no code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorInfo_describePrefixesCode', 0, () => {
      expect(new ErrorInfo(13900001, 'missing authorization', 'x').describe())
        .assertEqual('[13900001] missing authorization');
      expect(new ErrorInfo(0, 'Unknown error', 'x').describe()).assertEqual('Unknown error');
      expect(new ErrorInfo(-1, 'cancel failed', 'x').describe()).assertEqual('cancel failed');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0300
     * @tc.name errorInfoFactoryWiresHint003
     * @tc.desc Verify errorInfo builds a record whose hint comes from the picker hint mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorInfo_factoryWiresHint', 0, () => {
      const known = errorInfo(13900012, 'permission denied');
      expect(known.code).assertEqual(13900012);
      expect(known.message).assertEqual('permission denied');
      expect(known.hint).assertEqual('Permission denied; check the visibility configuration');
      expect(known.describe()).assertEqual('[13900012] permission denied');
      const unknown = errorInfo(0, '');
      expect(unknown.message).assertEqual('Unknown error');
      expect(unknown.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0400
     * @tc.name formatErrorWithCode004
     * @tc.desc Verify formatError includes the numeric code and detail when a code is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_withCode', 0, () => {
      expect(formatError('save', 13900015, 'target file already exists'))
        .assertEqual('save failed (13900015): target file already exists');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0500
     * @tc.name formatErrorWithoutCode005
     * @tc.desc Verify formatError omits the code and falls back to the unknown-error text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_withoutCode', 0, () => {
      expect(formatError('download', 0, '')).assertEqual('download failed: Unknown error');
      expect(formatError('download', -1, 'cancelled')).assertEqual('download failed: cancelled');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0600
     * @tc.name pickerErrorHintKnownCodes006
     * @tc.desc Verify every documented picker error code maps to its dedicated hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pickerErrorHint_knownCodes', 0, () => {
      expect(pickerErrorHint(13900001))
        .assertEqual('Operation not allowed; user authorization may be missing');
      expect(pickerErrorHint(13900002)).assertEqual('Target file or directory does not exist');
      expect(pickerErrorHint(13900012)).assertEqual('Permission denied; check the visibility configuration');
      expect(pickerErrorHint(13900015)).assertEqual('Target file already exists');
      expect(pickerErrorHint(13900020)).assertEqual('Invalid parameters; check the save options');
      expect(pickerErrorHint(13900042)).assertEqual('File service is temporarily unavailable; try again later');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTIL_0700
     * @tc.name pickerErrorHintUnknownCode007
     * @tc.desc Verify unknown or zero codes fall back to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('pickerErrorHint_unknownCode', 0, () => {
      expect(pickerErrorHint(0))
        .assertEqual('Falls back to the app sandbox when the picker is unavailable');
      expect(pickerErrorHint(123456))
        .assertEqual('Falls back to the app sandbox when the picker is unavailable');
    });
  });
}
