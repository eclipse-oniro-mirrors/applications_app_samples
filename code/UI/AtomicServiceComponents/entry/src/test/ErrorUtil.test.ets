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
// ErrorUtil 单测：ErrorInfo 的 code/message 归一化、describe 拼接、formatError 输出与 picker 错误码提示表。
// 页面上用户可读的错误文案全部来自这里，因此已知错误码必须逐一覆盖，未知码必须回落到沙箱降级提示。

import { describe, it, expect } from '@ohos/hypium';
import { errorInfo, formatError, pickerErrorHint } from '../main/ets/utils/ErrorUtil';

export default function errorUtilTest() {
  describe('ErrorUtilTest', () => {
    // errorInfo：带合法错误码时原样保留 code 与 message，describe 以 [code] 前缀输出，hint 与提示表一致
    it('errorInfo_codedError', 0, () => {
      const info = errorInfo(13900012, 'permission denied');
      expect(info.code).assertEqual(13900012);
      expect(info.message).assertEqual('permission denied');
      expect(info.describe()).assertEqual('[13900012] permission denied');
      expect(info.hint).assertEqual(pickerErrorHint(13900012));
    });

    // errorInfo：code=0 且 message 为空视为“未知错误”，hint 仍给出非空建议（兜底文案不为空）
    it('errorInfo_emptyMessage', 0, () => {
      const info = errorInfo(0, '');
      expect(info.message).assertEqual('未知错误');
      expect(info.describe()).assertEqual('未知错误');
      expect(info.hint.length > 0).assertTrue();
    });

    // formatError：code>0 时输出“动作失败（错误码）：原始信息”，不同动作词与错误码都要正确拼接
    it('formatError_withCode', 0, () => {
      expect(formatError('保存', 13900001, 'not allowed')).assertEqual('保存失败（13900001）：not allowed');
      expect(formatError('下载', 13900020, 'bad option')).assertEqual('下载失败（13900020）：bad option');
    });

    // formatError：code=0 与负数错误码都省略码段；message 为空回落“未知错误”
    it('formatError_withoutCode', 0, () => {
      expect(formatError('保存', 0, '')).assertEqual('保存失败：未知错误');
      expect(formatError('继续', 0, 'disk full')).assertEqual('继续失败：disk full');
      expect(formatError('拉起', -1, 'busy')).assertEqual('拉起失败：busy');
    });

    // pickerErrorHint：常见错误码（不存在/权限拒绝/参数无效）命中专属提示，且专属提示都不含“沙箱”（与兜底文案可区分）
    it('pickerErrorHint_knownAndUnknown', 0, () => {
      expect(pickerErrorHint(13900002).includes('不存在')).assertTrue();
      expect(pickerErrorHint(13900012).includes('权限被拒绝')).assertTrue();
      expect(pickerErrorHint(13900020).includes('参数无效')).assertTrue();
      expect(pickerErrorHint(13900002).includes('沙箱')).assertFalse();
      expect(pickerErrorHint(13900012).includes('沙箱')).assertFalse();
      expect(pickerErrorHint(13900020).includes('沙箱')).assertFalse();
      expect(pickerErrorHint(123456).includes('沙箱')).assertTrue();
    });

    // pickerErrorHint：已知码表全覆盖（操作不允许/已存在/服务暂不可用），0 与负数按未知码回落沙箱提示
    it('pickerErrorHint_coversAllKnownCodes', 0, () => {
      expect(pickerErrorHint(13900001).includes('操作不允许')).assertTrue();
      expect(pickerErrorHint(13900015).includes('已存在')).assertTrue();
      expect(pickerErrorHint(13900042).includes('稍后重试')).assertTrue();
      expect(pickerErrorHint(13900001).includes('沙箱')).assertFalse();
      expect(pickerErrorHint(13900015).includes('沙箱')).assertFalse();
      expect(pickerErrorHint(13900042).includes('沙箱')).assertFalse();
      expect(pickerErrorHint(-1).includes('沙箱')).assertTrue();
      expect(pickerErrorHint(0).includes('沙箱')).assertTrue();
    });

    // errorInfo：负数错误码不打码前缀、describe 原样输出 message；空 message 归一化且 hint 与提示表一致
    it('errorInfo_negativeCodeAndHint', 0, () => {
      const info = errorInfo(-1, '自定义错误');
      expect(info.describe()).assertEqual('自定义错误');
      expect(info.hint).assertEqual(pickerErrorHint(-1));
      const empty = errorInfo(13900001, '');
      expect(empty.message).assertEqual('未知错误');
      expect(empty.describe()).assertEqual('[13900001] 未知错误');
      expect(empty.hint.includes('操作不允许')).assertTrue();
    });
  });
}
