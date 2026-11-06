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
// ErrorUtil unit tests: ErrorInfo code/message normalization, describe concatenation, formatError output
// and the picker error-code hint table. All user-readable error text comes from here, so every known code
// must be covered and unknown codes must fall back to the sandbox degradation hint.

import { describe, it, expect } from '@ohos/hypium';
import { errorInfo, formatError, pickerErrorHint } from '../main/ets/utils/ErrorUtil';

export default function errorUtilTest() {
  describe('ErrorUtilTest', () => {
    // errorInfo: a valid code keeps code and message; describe prefixes [code]; hint matches the mapping
    it('errorInfo_codedError', 0, () => {
      const info = errorInfo(13900012, 'permission denied');
      expect(info.code).assertEqual(13900012);
      expect(info.message).assertEqual('permission denied');
      expect(info.describe()).assertEqual('[13900012] permission denied');
      expect(info.hint).assertEqual(pickerErrorHint(13900012));
    });

    // errorInfo: code=0 with an empty message is treated as unknown error; hint is still non-empty
    it('errorInfo_emptyMessage', 0, () => {
      const info = errorInfo(0, '');
      expect(info.message).assertEqual('Unknown error');
      expect(info.describe()).assertEqual('Unknown error');
      expect(info.hint.length > 0).assertTrue();
    });

    // formatError: code>0 yields "<action> failed (<code>): <message>"
    it('formatError_withCode', 0, () => {
      expect(formatError('save', 13900001, 'not allowed'))
        .assertEqual('save failed (13900001): not allowed');
      expect(formatError('download', 13900020, 'bad option'))
        .assertEqual('download failed (13900020): bad option');
    });

    // formatError: code=0 and negative codes omit the code; empty message falls back to unknown error
    it('formatError_withoutCode', 0, () => {
      expect(formatError('save', 0, '')).assertEqual('save failed: Unknown error');
      expect(formatError('continue', 0, 'disk full')).assertEqual('continue failed: disk full');
      expect(formatError('launch', -1, 'busy')).assertEqual('launch failed: busy');
    });

    // pickerErrorHint: known codes hit dedicated hints that are distinguishable from the sandbox fallback
    it('pickerErrorHint_knownAndUnknown', 0, () => {
      expect(pickerErrorHint(13900002).includes('does not exist')).assertTrue();
      expect(pickerErrorHint(13900012).includes('Permission denied')).assertTrue();
      expect(pickerErrorHint(13900020).includes('Invalid parameters')).assertTrue();
      expect(pickerErrorHint(13900002).includes('sandbox')).assertFalse();
      expect(pickerErrorHint(13900012).includes('sandbox')).assertFalse();
      expect(pickerErrorHint(13900020).includes('sandbox')).assertFalse();
      expect(pickerErrorHint(123456).includes('sandbox')).assertTrue();
    });

    // pickerErrorHint: full known-code coverage; 0 and negative codes fall back to the sandbox hint
    it('pickerErrorHint_coversAllKnownCodes', 0, () => {
      expect(pickerErrorHint(13900001).includes('Operation not allowed')).assertTrue();
      expect(pickerErrorHint(13900015).includes('already exists')).assertTrue();
      expect(pickerErrorHint(13900042).includes('try again later')).assertTrue();
      expect(pickerErrorHint(13900001).includes('sandbox')).assertFalse();
      expect(pickerErrorHint(13900015).includes('sandbox')).assertFalse();
      expect(pickerErrorHint(13900042).includes('sandbox')).assertFalse();
      expect(pickerErrorHint(-1).includes('sandbox')).assertTrue();
      expect(pickerErrorHint(0).includes('sandbox')).assertTrue();
    });

    // errorInfo: negative code has no bracket prefix; describe returns message; empty message normalizes
    it('errorInfo_negativeCodeAndHint', 0, () => {
      const info = errorInfo(-1, 'custom error');
      expect(info.describe()).assertEqual('custom error');
      expect(info.hint).assertEqual(pickerErrorHint(-1));
      const empty = errorInfo(13900001, '');
      expect(empty.message).assertEqual('Unknown error');
      expect(empty.describe()).assertEqual('[13900001] Unknown error');
      expect(empty.hint.includes('Operation not allowed')).assertTrue();
    });
  });
}
