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
 * 错误码分类：决定界面提示层级与可执行的恢复动作。
 */
export enum ScanErrorCategory {
  PERMISSION = 'permission',
  PARAMETER = 'parameter',
  DEVICE = 'device',
  FRAMEWORK = 'framework',
  UNKNOWN = 'unknown'
}

/**
 * 单个错误码的完整描述，messageKey 指向资源字符串。
 */
export interface ScanErrorInfo {
  code: number;
  known: boolean;
  category: ScanErrorCategory;
  retryable: boolean;
  requiresUserAction: boolean;
  messageKey: string;
}

/**
 * 扫描错误码映射表。五张表的索引一一对齐，全部取自 @ohos.scan 的 ScanErrorCode。
 */
export class ScanErrorMapper {
  static readonly UNKNOWN_MESSAGE_KEY: string = 'scan_error_unknown';

  // 数值与 @ohos.scan 的 ScanErrorCode 一一对应，写成字面量以免静态初始化依赖 syscap。
  static readonly CODES: number[] = [
    201, 202, 401, 13100001, 13100002, 13100003, 13100004,
    13100005, 13100006, 13100007, 13100008, 13100009, 13100010, 13100011, 13100012
  ];

  static readonly CATEGORIES: ScanErrorCategory[] = [
    ScanErrorCategory.PERMISSION,
    ScanErrorCategory.FRAMEWORK,
    ScanErrorCategory.PARAMETER,
    ScanErrorCategory.FRAMEWORK,
    ScanErrorCategory.FRAMEWORK,
    ScanErrorCategory.FRAMEWORK,
    ScanErrorCategory.FRAMEWORK,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.DEVICE,
    ScanErrorCategory.FRAMEWORK
  ];

  static readonly RETRYABLE: boolean[] = [
    false, true, false, true, true, true, false,
    true, true, false, false, false, false, true, true
  ];

  static readonly USER_ACTION: boolean[] = [
    true, true, false, false, false, false, true,
    false, false, true, true, true, true, false, false
  ];

  static readonly MESSAGE_KEYS: string[] = [
    'scan_error_no_permission',
    'scan_error_not_system_application',
    'scan_error_invalid_parameter',
    'scan_error_generic_failure',
    'scan_error_rpc_failure',
    'scan_error_server_failure',
    'scan_error_unsupported',
    'scan_error_canceled',
    'scan_error_device_busy',
    'scan_error_invalid',
    'scan_error_jammed',
    'scan_error_no_docs',
    'scan_error_cover_open',
    'scan_error_io_error',
    'scan_error_no_memory'
  ];

  /**
   * 返回错误码在映射表中的位置，未知码返回 -1。
   */
  static indexOf(code: number): number {
    return ScanErrorMapper.CODES.indexOf(code);
  }

  static isKnown(code: number): boolean {
    return ScanErrorMapper.indexOf(code) >= 0;
  }

  static getCategory(code: number): ScanErrorCategory {
    const index: number = ScanErrorMapper.indexOf(code);
    if (index < 0) {
      return ScanErrorCategory.UNKNOWN;
    }
    return ScanErrorMapper.CATEGORIES[index];
  }

  static isRetryable(code: number): boolean {
    const index: number = ScanErrorMapper.indexOf(code);
    if (index < 0) {
      return false;
    }
    return ScanErrorMapper.RETRYABLE[index];
  }

  static requiresUserAction(code: number): boolean {
    const index: number = ScanErrorMapper.indexOf(code);
    if (index < 0) {
      return false;
    }
    return ScanErrorMapper.USER_ACTION[index];
  }

  static getMessageKey(code: number): string {
    const index: number = ScanErrorMapper.indexOf(code);
    if (index < 0) {
      return ScanErrorMapper.UNKNOWN_MESSAGE_KEY;
    }
    return ScanErrorMapper.MESSAGE_KEYS[index];
  }

  /**
   * 汇总一个错误码的全部维度，界面据此一次性拿到提示与动作。
   */
  static describe(code: number): ScanErrorInfo {
    const info: ScanErrorInfo = {
      code: code,
      known: ScanErrorMapper.isKnown(code),
      category: ScanErrorMapper.getCategory(code),
      retryable: ScanErrorMapper.isRetryable(code),
      requiresUserAction: ScanErrorMapper.requiresUserAction(code),
      messageKey: ScanErrorMapper.getMessageKey(code)
    };
    return info;
  }

  static countKnown(codes: number[]): number {
    let count: number = 0;
    for (let index = 0; index < codes.length; index++) {
      if (ScanErrorMapper.isKnown(codes[index])) {
        count++;
      }
    }
    return count;
  }

  static countRetryable(codes: number[]): number {
    let count: number = 0;
    for (let index = 0; index < codes.length; index++) {
      if (ScanErrorMapper.isRetryable(codes[index])) {
        count++;
      }
    }
    return count;
  }

  static filterByCategory(codes: number[], category: ScanErrorCategory): number[] {
    const result: number[] = [];
    for (let index = 0; index < codes.length; index++) {
      if (ScanErrorMapper.getCategory(codes[index]) === category) {
        result.push(codes[index]);
      }
    }
    return result;
  }

  static countByCategory(codes: number[], category: ScanErrorCategory): number {
    return ScanErrorMapper.filterByCategory(codes, category).length;
  }

  static getKnownCodes(): number[] {
    return ScanErrorMapper.CODES.slice(0);
  }

  static hasUserActionIn(codes: number[]): boolean {
    for (let index = 0; index < codes.length; index++) {
      if (ScanErrorMapper.requiresUserAction(codes[index])) {
        return true;
      }
    }
    return false;
  }
}
