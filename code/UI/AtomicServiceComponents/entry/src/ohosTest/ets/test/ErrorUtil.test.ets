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
      const info = new ErrorInfo(0, '', '提示');
      expect(info.message).assertEqual('未知错误');
      expect(info.hint).assertEqual('提示');
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
      expect(new ErrorInfo(13900001, '缺少授权', 'x').describe()).assertEqual('[13900001] 缺少授权');
      expect(new ErrorInfo(0, '未知错误', 'x').describe()).assertEqual('未知错误');
      expect(new ErrorInfo(-1, '取消失败', 'x').describe()).assertEqual('取消失败');
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
      const known = errorInfo(13900012, '权限不足');
      expect(known.code).assertEqual(13900012);
      expect(known.message).assertEqual('权限不足');
      expect(known.hint).assertEqual('权限被拒绝，请检查可见性配置');
      expect(known.describe()).assertEqual('[13900012] 权限不足');
      const unknown = errorInfo(0, '');
      expect(unknown.message).assertEqual('未知错误');
      expect(unknown.hint).assertEqual('选择器不可用时将降级写入应用沙箱');
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
      expect(formatError('保存', 13900015, '目标文件已存在')).assertEqual('保存失败（13900015）：目标文件已存在');
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
      expect(formatError('下载', 0, '')).assertEqual('下载失败：未知错误');
      expect(formatError('下载', -1, '已取消')).assertEqual('下载失败：已取消');
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
      expect(pickerErrorHint(13900001)).assertEqual('操作不允许，可能缺少用户授权');
      expect(pickerErrorHint(13900002)).assertEqual('目标文件或目录不存在');
      expect(pickerErrorHint(13900012)).assertEqual('权限被拒绝，请检查可见性配置');
      expect(pickerErrorHint(13900015)).assertEqual('目标文件已存在');
      expect(pickerErrorHint(13900020)).assertEqual('参数无效，请检查保存选项');
      expect(pickerErrorHint(13900042)).assertEqual('文件服务暂不可用，可稍后重试');
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
      expect(pickerErrorHint(0)).assertEqual('选择器不可用时将降级写入应用沙箱');
      expect(pickerErrorHint(123456)).assertEqual('选择器不可用时将降级写入应用沙箱');
    });
  });
}
