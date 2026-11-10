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
 * 蓝牙接口的错误码封装。
 * Profile 相关接口在文档中声明了 201/401/801/2900001/2900003/2900004/2900099 七个错误码，
 * 这里把它们统一翻译成“可展示文本 + 处理建议”，由页面直接渲染，避免各处重复写 switch。
 * 文本统一经 StringResource 从 string.json 读取，模块里不出现界面字面量。
 */

import { BusinessError } from '@kit.BasicServicesKit';
import { text } from '../common/StringResource';
import {
  ERROR_CODE_BLUETOOTH_DISABLED,
  ERROR_CODE_CAPABILITY_UNSUPPORTED,
  ERROR_CODE_INVALID_PARAM,
  ERROR_CODE_OPERATION_FAILED,
  ERROR_CODE_PERMISSION_DENIED,
  ERROR_CODE_PROFILE_UNSUPPORTED,
  ERROR_CODE_SERVICE_STOPPED,
  ProbeStatus,
  classifyErrorCode,
  probeStatusHint
} from '../model/ProfileState';

export class ErrorInfo {
  code: number;
  message: string;
  hint: string;
  status: ProbeStatus;

  constructor(code: number, message: string, hint: string) {
    this.code = code;
    this.message = message.length > 0 ? message : text('err_unknown');
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
  return new ErrorInfo(code, message, bluetoothErrorHint(code));
}

export function formatError(action: string, code: number, message: string): string {
  const detail = message.length > 0 ? message : text('err_unknown');
  if (code > 0) {
    return text('err_action_failed_code', action, code, detail);
  }
  return text('err_action_failed', action, detail);
}

/** 逐条对应 @ohos.bluetooth.hfp 的错误码表格 */
export function bluetoothErrorHint(code: number): string {
  switch (code) {
    case ERROR_CODE_PERMISSION_DENIED:
      return text('err_permission');
    case ERROR_CODE_INVALID_PARAM:
      return text('err_invalid_param');
    case ERROR_CODE_CAPABILITY_UNSUPPORTED:
      return text('err_capability');
    case ERROR_CODE_SERVICE_STOPPED:
      return text('err_service_stopped');
    case ERROR_CODE_BLUETOOTH_DISABLED:
      return text('err_bt_disabled');
    case ERROR_CODE_PROFILE_UNSUPPORTED:
      return text('err_profile_unsupported');
    case ERROR_CODE_OPERATION_FAILED:
      return text('err_operation_failed');
    default:
      return code > 0 ? probeStatusHint(classifyErrorCode(code)) : text('err_ok');
  }
}

/** 是否为文档中登记过的蓝牙错误码 */
export function isKnownBluetoothCode(code: number): boolean {
  return code === ERROR_CODE_PERMISSION_DENIED || code === ERROR_CODE_INVALID_PARAM ||
    code === ERROR_CODE_CAPABILITY_UNSUPPORTED || code === ERROR_CODE_SERVICE_STOPPED ||
    code === ERROR_CODE_BLUETOOTH_DISABLED || code === ERROR_CODE_PROFILE_UNSUPPORTED ||
    code === ERROR_CODE_OPERATION_FAILED;
}

/**
 * 从 catch 到的对象里安全地取错误码。
 * 部分系统接口抛出的对象只有 message（形如 "BussinessError 201: Permission denied."），
 * 没有数值型 code 字段，直接读 code 会得到 0，从而把“权限被拒 / 能力不支持”误判为成功，
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

/** 从 catch 到的对象里安全地取错误描述 */
export function messageOfThrown(err: Object): string {
  const error = err as BusinessError;
  return typeof error.message === 'string' ? error.message : '';
}

/** 提取文本中第一段不少于 3 位的连续数字，避免依赖正则 */
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
  return text('err_combined', formatError(action, code, message), bluetoothErrorHint(code));
}
