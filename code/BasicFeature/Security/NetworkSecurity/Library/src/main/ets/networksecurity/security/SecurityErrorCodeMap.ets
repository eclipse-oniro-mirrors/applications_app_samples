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

import { SecurityErrorExplain } from './SecurityTypes';

/**
 * Maps error codes returned by networkSecurity / http / connection APIs to readable explanations.
 */
export class SecurityErrorCodeMap {
  // Static lookup table built once at class initialization time.
  private static errors: Map<number, SecurityErrorExplain> = SecurityErrorCodeMap.build();

  /**
   * Build the static error-code explanation table.
   * @returns a Map from numeric error code to its readable explanation.
   */
  private static build(): Map<number, SecurityErrorExplain> {
    // Create the empty lookup table that will hold all known error codes.
    const map: Map<number, SecurityErrorExplain> = new Map<number, SecurityErrorExplain>();
    // Register the explanation for permission error code 201.
    map.set(201, new SecurityErrorExplain(201, $r('app.string.ns_err_201_title'), $r('app.string.ns_err_201_reason'),
      $r('app.string.ns_err_201_suggestion'), 'error'));
    // Register the explanation for system internal error code 202.
    map.set(202, new SecurityErrorExplain(202, $r('app.string.ns_err_202_title'), $r('app.string.ns_err_202_reason'),
      $r('app.string.ns_err_202_suggestion'), 'error'));
    // Register the explanation for parameter error code 401.
    map.set(401, new SecurityErrorExplain(401, $r('app.string.ns_err_401_title'), $r('app.string.ns_err_401_reason'),
      $r('app.string.ns_err_401_suggestion'), 'warning'));
    // Register the explanation for cleartext blocked error code 2300997.
    map.set(2300997, new SecurityErrorExplain(2300997, $r('app.string.ns_err_2300997_title'),
      $r('app.string.ns_err_2300997_reason'), $r('app.string.ns_err_2300997_suggestion'), 'warning'));
    // Register the explanation for the unspecified error code 2305001.
    map.set(2305001, new SecurityErrorExplain(2305001, $r('app.string.ns_err_2305001_title'),
      $r('app.string.ns_err_2305001_reason'), $r('app.string.ns_err_2305001_suggestion'), 'error'));
    // Register the explanation for the missing issuer certificate error code 2305002.
    map.set(2305002, new SecurityErrorExplain(2305002, $r('app.string.ns_err_2305002_title'),
      $r('app.string.ns_err_2305002_reason'), $r('app.string.ns_err_2305002_suggestion'), 'error'));
    // Register the explanation for the undecryptable certificate signature error code 2305004.
    map.set(2305004, new SecurityErrorExplain(2305004, $r('app.string.ns_err_2305004_title'),
      $r('app.string.ns_err_2305004_reason'), $r('app.string.ns_err_2305004_suggestion'), 'error'));
    // Register the explanation for the certificate signature failure error code 2305007.
    map.set(2305007, new SecurityErrorExplain(2305007, $r('app.string.ns_err_2305007_title'),
      $r('app.string.ns_err_2305007_reason'), $r('app.string.ns_err_2305007_suggestion'), 'warning'));
    // Register the explanation for the not-yet-valid certificate error code 2305009.
    map.set(2305009, new SecurityErrorExplain(2305009, $r('app.string.ns_err_2305009_title'),
      $r('app.string.ns_err_2305009_reason'), $r('app.string.ns_err_2305009_suggestion'), 'warning'));
    // Register the explanation for the expired certificate error code 2305010.
    map.set(2305010, new SecurityErrorExplain(2305010, $r('app.string.ns_err_2305010_title'),
      $r('app.string.ns_err_2305010_reason'), $r('app.string.ns_err_2305010_suggestion'), 'error'));
    // Register the explanation for the not-yet-valid CRL error code 2305011.
    map.set(2305011, new SecurityErrorExplain(2305011, $r('app.string.ns_err_2305011_title'),
      $r('app.string.ns_err_2305011_reason'), $r('app.string.ns_err_2305011_suggestion'), 'error'));
    // Register the explanation for the expired CRL error code 2305012.
    map.set(2305012, new SecurityErrorExplain(2305012, $r('app.string.ns_err_2305012_title'),
      $r('app.string.ns_err_2305012_reason'), $r('app.string.ns_err_2305012_suggestion'), 'warning'));
    // Register the explanation for the self-signed certificate error code 2305018.
    map.set(2305018, new SecurityErrorExplain(2305018, $r('app.string.ns_err_2305018_title'),
      $r('app.string.ns_err_2305018_reason'), $r('app.string.ns_err_2305018_suggestion'), 'warning'));
    // Register the explanation for the invalid verification context error code 2305069.
    map.set(2305069, new SecurityErrorExplain(2305069, $r('app.string.ns_err_2305069_title'),
      $r('app.string.ns_err_2305069_reason'), $r('app.string.ns_err_2305069_suggestion'), 'error'));
    // Return the fully populated lookup table.
    return map;
  }

  /**
   * Resolve a numeric error code to its readable explanation.
   * @param code numeric error code returned by networkSecurity, http or connection APIs.
   * @returns the registered explanation, or a generic unknown-code explanation.
   */
  static explain(code: number): SecurityErrorExplain {
    // Look up the code in the static explanation table.
    const found: SecurityErrorExplain | undefined = SecurityErrorCodeMap.errors.get(code);
    // Return the registered explanation when the code is known.
    if (found !== undefined) {
      return found;
    }
    // Fall back to a generic explanation so the UI always has content to render.
    return new SecurityErrorExplain(code, $r('app.string.ns_err_unknown_title'), $r('app.string.ns_err_unknown_reason'),
      $r('app.string.ns_err_unknown_suggestion'), 'error');
  }
}
