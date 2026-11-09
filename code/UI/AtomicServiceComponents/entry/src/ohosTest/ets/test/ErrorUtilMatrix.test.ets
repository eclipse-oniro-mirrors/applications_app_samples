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
 
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  ErrorInfo,
  errorInfo,
  formatError,
  pickerErrorHint
} from '../../../main/ets/utils/ErrorUtil';

export default function errorUtilMatrixTest() {
  describe('errorUtilMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0100
     * @tc.name hintPermissionDenied010
     * @tc.desc Verify the operation-not-allowed picker code maps to its permission hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(13900001))
        .assertEqual('Operation not allowed; user authorization may be missing');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0200
     * @tc.name hintTargetMissing020
     * @tc.desc Verify the target-missing picker code maps to its hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(13900002)).assertEqual('Target file or directory does not exist');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0300
     * @tc.name hintVisibilityConfig030
     * @tc.desc Verify the permission-denied picker code maps to its visibility hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(13900012)).assertEqual('Permission denied; check the visibility configuration');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0400
     * @tc.name hintFileExists040
     * @tc.desc Verify the file-exists picker code maps to its hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(13900015)).assertEqual('Target file already exists');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0500
     * @tc.name hintInvalidOption050
     * @tc.desc Verify the invalid-option picker code maps to its hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(13900020)).assertEqual('Invalid parameters; check the save options');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0600
     * @tc.name hintServiceUnavailable060
     * @tc.desc Verify the service-unavailable picker code maps to its retry hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(13900042))
        .assertEqual('File service is temporarily unavailable; try again later');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0700
     * @tc.name hintZero070
     * @tc.desc Verify a zero code maps to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(0))
        .assertEqual('Falls back to the app sandbox when the picker is unavailable');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0800
     * @tc.name hintNegative080
     * @tc.desc Verify a negative code maps to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_negative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(-1))
        .assertEqual('Falls back to the app sandbox when the picker is unavailable');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0900
     * @tc.name hintUnknownLarge090
     * @tc.desc Verify an undocumented positive code maps to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_unknownLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(pickerErrorHint(999999))
        .assertEqual('Falls back to the app sandbox when the picker is unavailable');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1000
     * @tc.name describePositiveCode100
     * @tc.desc Verify describe prefixes a positive error code in brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_positiveCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(new ErrorInfo(13900001, 'missing authorization', 'hint').describe())
        .assertEqual('[13900001] missing authorization');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1100
     * @tc.name describeZeroCode110
     * @tc.desc Verify describe omits the bracket prefix when the code is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_zeroCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(new ErrorInfo(0, 'Unknown error', 'hint').describe()).assertEqual('Unknown error');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1200
     * @tc.name describeNegativeCode120
     * @tc.desc Verify describe omits the bracket prefix for a negative code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_negativeCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(new ErrorInfo(-1, 'cancel failed', 'hint').describe()).assertEqual('cancel failed');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1300
     * @tc.name describeEmptyMessage130
     * @tc.desc Verify an empty message is replaced by the unknown-error text before describing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_emptyMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(new ErrorInfo(0, '', 'hint').describe()).assertEqual('Unknown error');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1400
     * @tc.name formatErrorPositive140
     * @tc.desc Verify formatError embeds the code and detail in the failure message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_positive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatError('save', 13900015, 'target file already exists'))
        .assertEqual('save failed (13900015): target file already exists');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1500
     * @tc.name formatErrorZeroEmpty150
     * @tc.desc Verify formatError falls back to the unknown-error text when code and message are empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_zeroEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatError('download', 0, '')).assertEqual('download failed: Unknown error');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1600
     * @tc.name formatErrorNegative160
     * @tc.desc Verify formatError omits the code for a negative value but keeps the detail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_negative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(formatError('download', -1, 'cancelled')).assertEqual('download failed: cancelled');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1700
     * @tc.name factoryKnownHint170
     * @tc.desc Verify the factory wires a known picker code to its dedicated hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_knownHint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const info = errorInfo(13900012, 'permission denied');
      expect(info.code).assertEqual(13900012);
      expect(info.hint).assertEqual('Permission denied; check the visibility configuration');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1800
     * @tc.name factoryUnknownHint180
     * @tc.desc Verify the factory falls back to the sandbox hint and unknown-error text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_unknownHint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const info = errorInfo(0, '');
      expect(info.message).assertEqual('Unknown error');
      expect(info.hint).assertEqual('Falls back to the app sandbox when the picker is unavailable');
    });
  });
}
