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
 * 分布式链路接口的错误码封装。
 * linkEnhance 与 proxyChannelManager 在 d.ts 里声明了两组错误码（201/801 + 32390xxx），
 * 这里把它们统一翻译成「可展示文案 + 处理建议」，页面直接渲染，避免各处重复写 switch。
 * 文案存于 string.json，函数返回当前语言下的文本。
 */

import { BusinessError } from '@kit.BasicServicesKit';
import { ProbeStatus, classifyErrorCode, probeStatusHint } from '../model/ProbeState';
import { text, text2, text3 } from '../common/StringResource';

export class ErrorInfo {
  public code: number;
  public message: string;
  public hint: string;
  public status: ProbeStatus;

  constructor(code: number, message: string, hint: string) {
    this.code = code;
    this.message = message.length > 0 ? message : text('error_unknown');
    this.hint = hint;
    this.status = classifyErrorCode(code);
  }

  describe(): string {
    if (this.code > 0) {
      return `[${this.code}] ${this.message}`;
    }
    return this.message;
  }
}

export function errorInfo(code: number, message: string): ErrorInfo {
  return new ErrorInfo(code, message, distributedErrorHint(code));
}

export function formatError(action: string, code: number, message: string): string {
  const detail = message.length > 0 ? message : text('error_unknown');
  if (code > 0) {
    return text3('error_with_code', action, `${code}`, detail);
  }
  return text2('error_no_code', action, detail);
}

/** 逐条对应 @ohos.distributedsched.linkEnhance / proxyChannelManager 的错误码表格 */
export function distributedErrorHint(code: number): string {
  switch (code) {
    case 201:
      return text('err_hint_201');
    case 801:
      return text('err_hint_801');
    case 32390001:
      return text('err_hint_32390001');
    case 32390002:
      return text('err_hint_32390002');
    case 32390004:
      return text('err_hint_32390004');
    case 32390006:
      return text('err_hint_32390006');
    case 32390100:
      // 实测：module.json5 未声明 action.ohos.pull.listener 时，系统侧 GetCallerHapInfo
      // 反查调用方 abilityName 失败（底层 ret=8521221），上层统一折算成这个码
      return text('err_hint_32390100');
    case 32390101:
      // 实测：声明 action 后系统会向推送服务校验调用方权限，Remote is nullptr 时返回该码
      return text('err_hint_32390101');
    case 32390102:
      return text('err_hint_32390102');
    case 32390103:
      return text('err_hint_32390103');
    case 32390104:
      return text('err_hint_32390104');
    case 32390200:
      return text('err_hint_32390200');
    case 32390201:
      return text('err_hint_32390201');
    case 32390202:
      return text('err_hint_32390202');
    case 32390203:
      return text('err_hint_32390203');
    case 32390204:
      return text('err_hint_32390204');
    case 32390205:
      return text('err_hint_32390205');
    case 32390206:
      return text('err_hint_32390206');
    case 32390300:
      return text('err_hint_32390300');
    default:
      return code > 0 ? probeStatusHint(classifyErrorCode(code)) : text('err_hint_done');
  }
}

/** 是否为文档中登记过的错误码 */
export function isKnownDistributedCode(code: number): boolean {
  return code === 201 || code === 801 ||
    (code >= 32390001 && code <= 32390104) || (code >= 32390200 && code <= 32390300);
}

/**
 * 从 catch 到的对象里安全地取错误码。
 * 部分系统接口抛出的对象只有 message（形如 "BusinessError 201: Permission denied."），
 * 没有数值型 code 字段，直接读 code 会得到 0，从而把「权限被拒」误判为成功，
 * 因此这里退回到 message 中提取第一段不少于 3 位的数字。
 */
export function codeOfThrown(err: Object): number {
  const error = err as BusinessError;
  if (typeof error.code === 'number') {
    return error.code;
  }
  if (typeof error.message === 'string') {
    return codeInText(error.message);
  }
  return 0;
}

/** 从 catch 到的对象里安全地取错误描述；对象既没有 message 也没有 name 时退回字符串化结果 */
export function messageOfThrown(err: Object): string {
  const error = err as BusinessError;
  if (typeof error.message === 'string' && error.message.length > 0) {
    return error.message;
  }
  if (typeof error.name === 'string' && error.name.length > 0) {
    return error.name;
  }
  return `${err}`;
}

/** 提取文本中第一段不少于 3 位的连续数字，避免依赖正则；入参不能叫 text，会与文案解析函数重名 */
function codeInText(source: string): number {
  let digits = '';
  for (let i = 0; i < source.length; i++) {
    const charCode = source.charCodeAt(i);
    if (charCode >= 48 && charCode <= 57) {
      digits += source.charAt(i);
      continue;
    }
    if (digits.length >= 3) {
      return Number(digits);
    }
    digits = '';
  }
  return digits.length >= 3 ? Number(digits) : 0;
}

/** 把 catch 到的异常折算成页面上的一行描述，避免各页面各写一套格式 */
export function describeThrown(action: string, code: number, message: string): string {
  return text2('error_describe_thrown', formatError(action, code, message), distributedErrorHint(code));
}
