/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { formatTimestamp } from './FormatCore';

export enum ErrorCategory {
  NONE = 'none',
  FILE_NOT_FOUND = 'file_not_found',
  PERMISSION_DENIED = 'permission_denied',
  INVALID_ARGUMENT = 'invalid_argument',
  NETWORK = 'network',
  STORAGE_FULL = 'storage_full',
  OUT_OF_MEMORY = 'out_of_memory',
  DLP_POLICY = 'dlp_policy',
  ACCOUNT = 'account',
  INTERNAL = 'internal',
  UNKNOWN = 'unknown'
}

export enum ErrorSeverity {
  INFO = 'info',
  WARNING = 'warning',
  ERROR = 'error',
  FATAL = 'fatal'
}

export class ErrorInfo {
  public readonly code: number;
  public readonly category: ErrorCategory;
  public readonly severity: ErrorSeverity;
  public readonly retryable: boolean;
  public readonly message: string;
  public readonly hint: string;

  constructor(code: number, category: ErrorCategory, severity: ErrorSeverity, retryable: boolean, message: string,
    hint: string) {
    this.code = code;
    this.category = category;
    this.severity = severity;
    this.retryable = retryable;
    this.message = message;
    this.hint = hint;
  }
}

export class ErrorReport {
  public readonly code: number;
  public readonly operation: string;
  public readonly detail: string;
  public readonly occurredAtSec: number;

  constructor(code: number, operation: string, detail: string, occurredAtSec: number) {
    this.code = code;
    this.operation = operation;
    this.detail = detail;
    this.occurredAtSec = occurredAtSec;
  }
}

export function normalizeCode(code: number): number {
  if (!Number.isFinite(code)) {
    return -1;
  }
  return Math.floor(code);
}

export function isSuccess(code: number): boolean {
  return normalizeCode(code) === 0;
}

export function parseErrorCode(text: string): number {
  const trimmed: string = text.trim();
  if (trimmed.length === 0) {
    return -1;
  }
  if (trimmed.startsWith('0x') || trimmed.startsWith('0X')) {
    const body: string = trimmed.substring(2);
    if (body.length === 0) {
      return -1;
    }
    const value: number = Number.parseInt(body, 16);
    if (!Number.isFinite(value)) {
      return -1;
    }
    return value;
  }
  const value: number = Number.parseInt(trimmed, 10);
  if (!Number.isFinite(value)) {
    return -1;
  }
  if (value.toString() !== trimmed) {
    return -1;
  }
  return value;
}

export function formatCode(code: number): string {
  const normalized: number = normalizeCode(code);
  if (normalized < 0) {
    return '0xFFFFFFFF';
  }
  let hex: string = normalized.toString(16).toUpperCase();
  while (hex.length < 8) {
    hex = '0' + hex;
  }
  return '0x' + hex;
}

export function lookupError(code: number): ErrorInfo {
  const normalized: number = normalizeCode(code);
  if (normalized === 0) {
    return new ErrorInfo(0, ErrorCategory.NONE, ErrorSeverity.INFO, false, '操作成功', '');
  }
  if (normalized === 13900001) {
    return new ErrorInfo(normalized, ErrorCategory.PERMISSION_DENIED, ErrorSeverity.ERROR, false,
      '操作不被允许', '请检查应用权限或文件所属账号');
  }
  if (normalized === 13900002) {
    return new ErrorInfo(normalized, ErrorCategory.FILE_NOT_FOUND, ErrorSeverity.ERROR, false,
      '文件不存在', '请刷新文件列表后重试');
  }
  if (normalized === 13900004) {
    return new ErrorInfo(normalized, ErrorCategory.INTERNAL, ErrorSeverity.WARNING, true,
      '系统调用被中断', '请稍后重试');
  }
  if (normalized === 13900005) {
    return new ErrorInfo(normalized, ErrorCategory.INTERNAL, ErrorSeverity.ERROR, true,
      '读写文件失败', '请重试；多次失败请重新打开文件');
  }
  if (normalized === 13900008) {
    return new ErrorInfo(normalized, ErrorCategory.INTERNAL, ErrorSeverity.ERROR, false,
      '文件句柄无效', '请重新打开文件');
  }
  if (normalized === 13900011) {
    return new ErrorInfo(normalized, ErrorCategory.INTERNAL, ErrorSeverity.WARNING, true,
      '资源暂时不可用', '请稍后重试');
  }
  if (normalized === 13900012) {
    return new ErrorInfo(normalized, ErrorCategory.PERMISSION_DENIED, ErrorSeverity.ERROR, false,
      '没有文件访问权限', '请先通过授权页面申请访问权限');
  }
  if (normalized === 13900013) {
    return new ErrorInfo(normalized, ErrorCategory.INVALID_ARGUMENT, ErrorSeverity.ERROR, false,
      '参数地址无效', '请检查传入的文件地址');
  }
  if (normalized === 13900015) {
    return new ErrorInfo(normalized, ErrorCategory.INTERNAL, ErrorSeverity.WARNING, true,
      '文件正被占用', '请关闭其他正在使用该文件的应用');
  }
  if (normalized === 13900019) {
    return new ErrorInfo(normalized, ErrorCategory.INVALID_ARGUMENT, ErrorSeverity.ERROR, false,
      '目标是目录而非文件', '请重新选择文件');
  }
  if (normalized === 13900020) {
    return new ErrorInfo(normalized, ErrorCategory.INVALID_ARGUMENT, ErrorSeverity.ERROR, false,
      '参数不合法', '请检查输入内容');
  }
  if (normalized === 13900025) {
    return new ErrorInfo(normalized, ErrorCategory.STORAGE_FULL, ErrorSeverity.ERROR, false,
      '存储空间不足', '请清理文件后重试');
  }
  if (normalized === 13900030) {
    return new ErrorInfo(normalized, ErrorCategory.INVALID_ARGUMENT, ErrorSeverity.ERROR, false,
      '文件名过长', '请缩短文件名');
  }
  if (normalized === 13900042) {
    return new ErrorInfo(normalized, ErrorCategory.NETWORK, ErrorSeverity.ERROR, true,
      '操作超时', '请检查网络后重试');
  }
  if (normalized === 19100001) {
    return new ErrorInfo(normalized, ErrorCategory.DLP_POLICY, ErrorSeverity.ERROR, false,
      'DLP 策略配置错误', '请重新编辑加密权限');
  }
  if (normalized === 19100002) {
    return new ErrorInfo(normalized, ErrorCategory.ACCOUNT, ErrorSeverity.ERROR, false,
      '账号不可用', '请登录或切换账号后重试');
  }
  if (normalized === 19100003) {
    return new ErrorInfo(normalized, ErrorCategory.DLP_POLICY, ErrorSeverity.ERROR, false,
      'DLP 权限已过期', '请联系文件所有者重新授权');
  }
  if (normalized === 19100004) {
    return new ErrorInfo(normalized, ErrorCategory.PERMISSION_DENIED, ErrorSeverity.ERROR, false,
      '没有该 DLP 文件的访问权限', '请申请访问权限后重试');
  }
  return new ErrorInfo(normalized, ErrorCategory.UNKNOWN, ErrorSeverity.ERROR, false,
    '未知错误', '请重试，若仍然失败请查看日志');
}

export function categoryOf(code: number): ErrorCategory {
  return lookupError(code).category;
}

export function severityOf(code: number): ErrorSeverity {
  return lookupError(code).severity;
}

export function isRetryable(code: number): boolean {
  return lookupError(code).retryable;
}

export function describeError(code: number): string {
  return lookupError(code).message;
}

export function hintOf(code: number): string {
  return lookupError(code).hint;
}

export function formatErrorReport(report: ErrorReport, useUtc: boolean): string {
  const info: ErrorInfo = lookupError(report.code);
  const chunks: string[] = [];
  chunks.push('code=' + formatCode(report.code));
  chunks.push('category=' + info.category.toString());
  chunks.push('severity=' + info.severity.toString());
  if (report.operation.length > 0) {
    chunks.push('operation=' + report.operation);
  }
  contentPushTime(chunks, report.occurredAtSec, useUtc);
  if (report.detail.length > 0) {
    chunks.push('detail=' + report.detail);
  }
  return chunks.join(', ');
}

function contentPushTime(chunks: string[], occurredAtSec: number, useUtc: boolean): void {
  const formatted: string = formatTimestamp(occurredAtSec, useUtc);
  if (formatted.length > 0) {
    chunks.push('time=' + formatted);
  }
}
