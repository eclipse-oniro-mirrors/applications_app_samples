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

/**
 * 错误码到"人话"的翻译层。
 * 输入法框架的错误码分三段：401/801 这类通用码、128000xx 这类 IME 子系统码、以及本地兜底码。
 * 页面与用例都只用这里的分类结果，避免同一串数字在两处得到不同解释。
 */

import { BusinessError } from '@kit.BasicServicesKit';
import {
  ApiStatus,
  ERROR_CODE_LOCAL_TIMEOUT,
  ERROR_CODE_LOCAL_UNEXPECTED_THROW,
  classifyErrorCode
} from '../model/CallOutcome';

/** 把状态翻译成处理建议 */
export function apiStatusHint(status: ApiStatus): string {
  switch (status) {
    case ApiStatus.INVALID_INPUT:
      return '入参不合法：确认键名非空、值仅为 number/string/boolean，扩展信息总长不超过 32KB';
    case ApiStatus.UNSUPPORTED:
      return '设备或系统不支持该能力：先在设置中启用输入法框架，再换设备复验，勿据此断定接口不可用';
    case ApiStatus.INPUT_METHOD:
      return '调用身份不符：createPanel 等接口只能在 InputMethodExtensionAbility 进程内调用，UIAbility 侧调用会抛 12800004';
    case ApiStatus.EMPTY_RESULT:
      return '接口返回 undefined 却没有错误码，失败没有上报出来；先按 hilog 里的 tag 定位底层实现';
    case ApiStatus.INTERNAL:
      return '内部错误：先检查输入法服务是否已启动，并用 hilog 过滤本示例 tag 查看调用顺序';
    default:
      return '调用正常完成';
  }
}

export function formatError(action: string, code: number, message: string): string {
  const detail = message.length > 0 ? message : '未知错误';
  if (code !== 0) {
    return `${action}失败（${code}）：${detail}`;
  }
  return `${action}失败：${detail}`;
}

/** 页面上一行文案：动作 + 错误码 + 原始描述 + 处理建议 */
export function describeThrown(action: string, code: number, message: string): string {
  const status = code === ERROR_CODE_LOCAL_TIMEOUT ? ApiStatus.EMPTY_RESULT : classifyErrorCode(code);
  return `${formatError(action, code, message)}；${apiStatusHint(status)}`;
}

/**
 * 从 catch 到的对象里安全地取错误码。
 * 两类对象都要兼容：BusinessError 带数值 code；部分接口抛出的对象只有 message
 * （形如 "BussinessError 401: ..."），得从文本里把码抠出来。
 * 两条路都拿不到码时返回本地占位码而不是 0 —— 返回 0 会让失败被归类成成功。
 */
export function codeOfThrown(err: Object): number {
  const error = err as BusinessError;
  if (typeof error.code === 'number') {
    return error.code;
  }
  if (typeof error.message === 'string') {
    const parsed = codeInText(error.message);
    if (parsed > 0) {
      return parsed;
    }
  }
  return ERROR_CODE_LOCAL_UNEXPECTED_THROW;
}

/** 从 catch 到的对象里安全地取错误描述 */
export function messageOfThrown(err: Object): string {
  const error = err as BusinessError;
  if (typeof error.message === 'string' && error.message.length > 0) {
    return error.message;
  }
  return `${err}`;
}

/** 提取文本中第一段不少于 3 位的连续数字，避免依赖正则 */
function codeInText(text: string): number {
  let digits = '';
  for (let i = 0; i < text.length; i++) {
    const charCode = text.charCodeAt(i);
    if (charCode >= 48 && charCode <= 57) {
      digits += text.charAt(i);
      continue;
    }
    if (digits.length >= 3) {
      return Number(digits);
    }
    digits = '';
  }
  return digits.length >= 3 ? Number(digits) : 0;
}
