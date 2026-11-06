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
 
export class ErrorInfo {
  public code: number;
  public message: string;
  public hint: string;

  constructor(code: number, message: string, hint: string) {
    this.code = code;
    this.message = message.length > 0 ? message : 'Unknown error';
    this.hint = hint;
  }

  describe(): string {
    if (this.code > 0) {
      return `[${this.code}] ${this.message}`;
    }
    return this.message;
  }
}

export function errorInfo(code: number, message: string): ErrorInfo {
  return new ErrorInfo(code, message, pickerErrorHint(code));
}

export function formatError(action: string, code: number, message: string): string {
  const detail = message.length > 0 ? message : 'Unknown error';
  if (code > 0) {
    return `${action} failed (${code}): ${detail}`;
  }
  return `${action} failed: ${detail}`;
}

export function pickerErrorHint(code: number): string {
  switch (code) {
    case 13900001:
      return 'Operation not allowed; user authorization may be missing';
    case 13900002:
      return 'Target file or directory does not exist';
    case 13900012:
      return 'Permission denied; check the visibility configuration';
    case 13900015:
      return 'Target file already exists';
    case 13900020:
      return 'Invalid parameters; check the save options';
    case 13900042:
      return 'File service is temporarily unavailable; try again later';
    default:
      return 'Falls back to the app sandbox when the picker is unavailable';
  }
}
