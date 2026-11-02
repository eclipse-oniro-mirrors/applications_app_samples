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
    it('hint_13900001', 0, () => {
      expect(pickerErrorHint(13900001)).assertEqual('操作不允许，可能缺少用户授权');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0200
     * @tc.name hintTargetMissing020
     * @tc.desc Verify the target-missing picker code maps to its hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900002', 0, () => {
      expect(pickerErrorHint(13900002)).assertEqual('目标文件或目录不存在');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0300
     * @tc.name hintVisibilityConfig030
     * @tc.desc Verify the permission-denied picker code maps to its visibility hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900012', 0, () => {
      expect(pickerErrorHint(13900012)).assertEqual('权限被拒绝，请检查可见性配置');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0400
     * @tc.name hintFileExists040
     * @tc.desc Verify the file-exists picker code maps to its hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900015', 0, () => {
      expect(pickerErrorHint(13900015)).assertEqual('目标文件已存在');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0500
     * @tc.name hintInvalidOption050
     * @tc.desc Verify the invalid-option picker code maps to its hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900020', 0, () => {
      expect(pickerErrorHint(13900020)).assertEqual('参数无效，请检查保存选项');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0600
     * @tc.name hintServiceUnavailable060
     * @tc.desc Verify the service-unavailable picker code maps to its retry hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_13900042', 0, () => {
      expect(pickerErrorHint(13900042)).assertEqual('文件服务暂不可用，可稍后重试');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0700
     * @tc.name hintZero070
     * @tc.desc Verify a zero code maps to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_zero', 0, () => {
      expect(pickerErrorHint(0)).assertEqual('选择器不可用时将降级写入应用沙箱');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0800
     * @tc.name hintNegative080
     * @tc.desc Verify a negative code maps to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_negative', 0, () => {
      expect(pickerErrorHint(-1)).assertEqual('选择器不可用时将降级写入应用沙箱');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_0900
     * @tc.name hintUnknownLarge090
     * @tc.desc Verify an undocumented positive code maps to the sandbox degradation hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hint_unknownLarge', 0, () => {
      expect(pickerErrorHint(999999)).assertEqual('选择器不可用时将降级写入应用沙箱');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1000
     * @tc.name describePositiveCode100
     * @tc.desc Verify describe prefixes a positive error code in brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_positiveCode', 0, () => {
      expect(new ErrorInfo(13900001, '缺少授权', '提示').describe()).assertEqual('[13900001] 缺少授权');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1100
     * @tc.name describeZeroCode110
     * @tc.desc Verify describe omits the bracket prefix when the code is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_zeroCode', 0, () => {
      expect(new ErrorInfo(0, '未知错误', '提示').describe()).assertEqual('未知错误');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1200
     * @tc.name describeNegativeCode120
     * @tc.desc Verify describe omits the bracket prefix for a negative code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_negativeCode', 0, () => {
      expect(new ErrorInfo(-1, '取消失败', '提示').describe()).assertEqual('取消失败');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1300
     * @tc.name describeEmptyMessage130
     * @tc.desc Verify an empty message is replaced by the unknown-error text before describing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describe_emptyMessage', 0, () => {
      expect(new ErrorInfo(0, '', '提示').describe()).assertEqual('未知错误');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1400
     * @tc.name formatErrorPositive140
     * @tc.desc Verify formatError embeds the code and detail in the failure message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_positive', 0, () => {
      expect(formatError('保存', 13900015, '目标文件已存在'))
        .assertEqual('保存失败（13900015）：目标文件已存在');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1500
     * @tc.name formatErrorZeroEmpty150
     * @tc.desc Verify formatError falls back to the unknown-error text when code and message are empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_zeroEmpty', 0, () => {
      expect(formatError('下载', 0, '')).assertEqual('下载失败：未知错误');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1600
     * @tc.name formatErrorNegative160
     * @tc.desc Verify formatError omits the code for a negative value but keeps the detail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatError_negative', 0, () => {
      expect(formatError('下载', -1, '已取消')).assertEqual('下载失败：已取消');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1700
     * @tc.name factoryKnownHint170
     * @tc.desc Verify the factory wires a known picker code to its dedicated hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_knownHint', 0, () => {
      const info = errorInfo(13900012, '权限不足');
      expect(info.code).assertEqual(13900012);
      expect(info.hint).assertEqual('权限被拒绝，请检查可见性配置');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ERRORUTILMATRIX_1800
     * @tc.name factoryUnknownHint180
     * @tc.desc Verify the factory falls back to the sandbox hint and unknown-error text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_unknownHint', 0, () => {
      const info = errorInfo(0, '');
      expect(info.message).assertEqual('未知错误');
      expect(info.hint).assertEqual('选择器不可用时将降级写入应用沙箱');
    });
  });
}
