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

import { ErrorCategory, ErrorInfo, formatCode, lookupError } from '../core/ErrorCodeCore';

const KNOWN_CODES: Array<number> = [0, 13900001, 13900002, 13900004, 13900005, 13900008, 13900011, 13900012,
  13900013, 13900015, 13900019, 13900020, 13900025, 13900030, 13900042, 19100001, 19100002, 19100003, 19100004];

export function categoryLabel(category: ErrorCategory): string {
  if (category === ErrorCategory.NONE) {
    return '成功';
  }
  if (category === ErrorCategory.FILE_NOT_FOUND) {
    return '文件不存在';
  }
  if (category === ErrorCategory.PERMISSION_DENIED) {
    return '权限不足';
  }
  if (category === ErrorCategory.INVALID_ARGUMENT) {
    return '参数错误';
  }
  if (category === ErrorCategory.NETWORK) {
    return '网络';
  }
  if (category === ErrorCategory.STORAGE_FULL) {
    return '存储空间';
  }
  if (category === ErrorCategory.OUT_OF_MEMORY) {
    return '内存';
  }
  if (category === ErrorCategory.DLP_POLICY) {
    return 'DLP 策略';
  }
  if (category === ErrorCategory.ACCOUNT) {
    return '账号';
  }
  if (category === ErrorCategory.INTERNAL) {
    return '内部错误';
  }
  return '未知';
}

export class ErrorCenterModel {
  static knownCodes(): Array<number> {
    const copy: Array<number> = [];
    for (let index = 0; index < KNOWN_CODES.length; index++) {
      copy.push(KNOWN_CODES[index]);
    }
    return copy;
  }

  static entries(): Array<ErrorInfo> {
    const result: Array<ErrorInfo> = [];
    for (let index = 0; index < KNOWN_CODES.length; index++) {
      result.push(lookupError(KNOWN_CODES[index]));
    }
    return result;
  }

  static filter(keyword: string, categoryKey: string): Array<ErrorInfo> {
    const all: Array<ErrorInfo> = ErrorCenterModel.entries();
    const result: Array<ErrorInfo> = [];
    const needle: string = keyword.trim().toLowerCase();
    for (let index = 0; index < all.length; index++) {
      const info: ErrorInfo = all[index];
      if (categoryKey !== 'all' && info.category.toString() !== categoryKey) {
        continue;
      }
      if (needle.length === 0) {
        result.push(info);
        continue;
      }
      const haystack: string = (formatCode(info.code) + ' ' + info.code.toString() + ' ' + info.message + ' ' +
        info.hint).toLowerCase();
      if (haystack.indexOf(needle) >= 0) {
        result.push(info);
      }
    }
    return result;
  }

  static categoryKeys(): Array<string> {
    return ['all', ErrorCategory.FILE_NOT_FOUND.toString(), ErrorCategory.PERMISSION_DENIED.toString(),
      ErrorCategory.DLP_POLICY.toString(), ErrorCategory.STORAGE_FULL.toString()];
  }

  static retryableCount(entries: Array<ErrorInfo>): number {
    let count: number = 0;
    for (let index = 0; index < entries.length; index++) {
      if (entries[index].retryable) {
        count += 1;
      }
    }
    return count;
  }

  static formattedCode(info: ErrorInfo): string {
    return formatCode(info.code);
  }

  static retryableLabel(info: ErrorInfo): string {
    return info.retryable ? '可重试' : '不可重试';
  }
}
