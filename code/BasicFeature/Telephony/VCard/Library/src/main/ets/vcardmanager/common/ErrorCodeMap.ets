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

const CODE_PERMISSION_DENIED: number = 201;
const CODE_PARAMETER_ERROR: number = 401;
const CODE_INVALID_PARAMETER: number = 8300001;
const CODE_SYSTEM_ERROR: number = 8300003;
const CODE_UNKNOWN: number = 8300999;
const CODE_FILE_NOT_FOUND: number = 13900002;

export class ErrorExplain {
  public code: number;
  public severity: string;
  public title: ResourceStr;
  public reason: ResourceStr;
  public suggestion: ResourceStr;

  constructor(code: number, severity: string, title: ResourceStr, reason: ResourceStr, suggestion: ResourceStr) {
    this.code = code;
    this.severity = severity;
    this.title = title;
    this.reason = reason;
    this.suggestion = suggestion;
  }
}

export class ErrorCodeMap {
  static explain(code: number): ErrorExplain {
    if (code === CODE_PERMISSION_DENIED) {
      return new ErrorExplain(code, 'error', $r('app.string.vc_error_201_title'),
        $r('app.string.vc_error_201_reason'), $r('app.string.vc_error_201_suggestion'));
    }
    if (code === CODE_PARAMETER_ERROR) {
      return new ErrorExplain(code, 'warning', $r('app.string.vc_error_401_title'),
        $r('app.string.vc_error_401_reason'), $r('app.string.vc_error_401_suggestion'));
    }
    if (code === CODE_INVALID_PARAMETER) {
      return new ErrorExplain(code, 'warning', $r('app.string.vc_error_8300001_title'),
        $r('app.string.vc_error_8300001_reason'), $r('app.string.vc_error_8300001_suggestion'));
    }
    if (code === CODE_SYSTEM_ERROR) {
      return new ErrorExplain(code, 'error', $r('app.string.vc_error_8300003_title'),
        $r('app.string.vc_error_8300003_reason'), $r('app.string.vc_error_8300003_suggestion'));
    }
    if (code === CODE_UNKNOWN) {
      return new ErrorExplain(code, 'error', $r('app.string.vc_error_8300999_title'),
        $r('app.string.vc_error_8300999_reason'), $r('app.string.vc_error_8300999_suggestion'));
    }
    if (code === CODE_FILE_NOT_FOUND) {
      return new ErrorExplain(code, 'error', $r('app.string.vc_error_13900002_title'),
        $r('app.string.vc_error_13900002_reason'), $r('app.string.vc_error_13900002_suggestion'));
    }
    return new ErrorExplain(code, 'error', $r('app.string.vc_error_unknown_title'),
      $r('app.string.vc_error_unknown_reason'), $r('app.string.vc_error_unknown_suggestion'));
  }
}
