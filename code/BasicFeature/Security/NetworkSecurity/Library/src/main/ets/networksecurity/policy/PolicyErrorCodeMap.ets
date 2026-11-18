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

import { ErrorExplain } from './PolicyTypes';

// 201: the caller lacks the required system permission.
export const ERROR_PERMISSION_DENIED: number = 201;
// 202: the caller is not a system application.
export const ERROR_NOT_SYSTEM_APP: number = 202;
// 401: a parameter failed the basic check.
const ERROR_PARAMETER_CHECK_FAILED: number = 401;
// 2100001: a parameter value is out of range or invalid.
const ERROR_PARAMETER_INVALID: number = 2100001;
// 2100002: the connection to the netpolicy service failed.
const ERROR_SERVICE_CONNECTION_FAILED: number = 2100002;
// 2100003: an internal error occurred inside the netpolicy service.
const ERROR_INTERNAL: number = 2100003;

/**
 * Error code dictionary of @ohos.net.policy. Mirrors the FontAndResource ErrorCodeMap pattern.
 */
export class PolicyErrorCodeMap {
  // Lookup table from BusinessError code to explanation, built once at load time.
  private static errors: Map<number, ErrorExplain> = PolicyErrorCodeMap.build();

  /**
   * 201 and 202 both mean the caller is not a signed system application.
   * @param code BusinessError code to classify.
   * @returns true when the code means a system-restriction failure.
   */
  static isSystemRestricted(code: number): boolean {
    // Restricted when either 201 or 202 is reported.
    return code === ERROR_PERMISSION_DENIED || code === ERROR_NOT_SYSTEM_APP;
  }

  /**
   * Build the lookup table with one explanation per known error code.
   * @returns the initialized code-to-explanation map.
   */
  private static build(): Map<number, ErrorExplain> {
    // Start from an empty typed map.
    const map: Map<number, ErrorExplain> = new Map<number, ErrorExplain>();
    // Explain 201: permission denied.
    map.set(ERROR_PERMISSION_DENIED, new ErrorExplain(ERROR_PERMISSION_DENIED,
      $r('app.string.ns_err_201_title'), $r('app.string.ns_err_201_reason'),
      $r('app.string.ns_err_201_suggestion'), 'error'));
    // Explain 202: not a system application.
    map.set(ERROR_NOT_SYSTEM_APP, new ErrorExplain(ERROR_NOT_SYSTEM_APP,
      $r('app.string.ns_err_202_title'), $r('app.string.ns_err_202_reason'),
      $r('app.string.ns_err_202_suggestion'), 'error'));
    // Explain 401: parameter check failed.
    map.set(ERROR_PARAMETER_CHECK_FAILED, new ErrorExplain(ERROR_PARAMETER_CHECK_FAILED,
      $r('app.string.ns_err_401_title'), $r('app.string.ns_err_401_reason'),
      $r('app.string.ns_err_401_suggestion'), 'warning'));
    // Explain 2100001: invalid parameter value.
    map.set(ERROR_PARAMETER_INVALID, new ErrorExplain(ERROR_PARAMETER_INVALID,
      $r('app.string.ns_err_2100001_title'), $r('app.string.ns_err_2100001_reason'),
      $r('app.string.ns_err_2100001_suggestion'), 'warning'));
    // Explain 2100002: service connection failed.
    map.set(ERROR_SERVICE_CONNECTION_FAILED, new ErrorExplain(ERROR_SERVICE_CONNECTION_FAILED,
      $r('app.string.ns_err_2100002_title'), $r('app.string.ns_err_2100002_reason'),
      $r('app.string.ns_err_2100002_suggestion'), 'warning'));
    // Explain 2100003: internal service error.
    map.set(ERROR_INTERNAL, new ErrorExplain(ERROR_INTERNAL,
      $r('app.string.ns_err_2100003_title'), $r('app.string.ns_err_2100003_reason'),
      $r('app.string.ns_err_2100003_suggestion'), 'error'));
    // Return the fully populated map.
    return map;
  }

  /**
   * Explain a BusinessError code, with a generic fallback for unknown codes.
   * @param code BusinessError code to explain.
   * @returns the matching explanation, or a generic one for unknown codes.
   */
  static explain(code: number): ErrorExplain {
    // Look up the known explanation for the code.
    const found: ErrorExplain | undefined = PolicyErrorCodeMap.errors.get(code);
    if (found !== undefined) {
      // Return the known explanation directly.
      return found;
    }
    // Fall back to a generic explanation for unknown codes.
    return new ErrorExplain(code, $r('app.string.ns_err_unknown_title'),
      $r('app.string.ns_err_unknown_reason'), $r('app.string.ns_err_unknown_suggestion'), 'error');
  }
}
