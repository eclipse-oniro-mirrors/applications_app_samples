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

// Import the error explanation model that this map produces.
import { ErrorExplain } from '../model/FontTypes';

// Static registry that maps font error codes onto localized explanation entries.
export class ErrorCodeMap {
  // The lazily built singleton map holding every known error code entry.
  private static errors: Map<number, ErrorExplain> = ErrorCodeMap.build();

  // Builds the full error code table once at class load time.
  private static build(): Map<number, ErrorExplain> {
    // Create the empty map that receives all entries below.
    const map: Map<number, ErrorExplain> = new Map<number, ErrorExplain>();
    // Register error 201: permission denied, treated as a hard error.
    map.set(201, new ErrorExplain(201, $r('app.string.fr_err_201_title'), $r('app.string.fr_err_201_reason'),
      $r('app.string.fr_err_201_suggestion'), 'error'));
    // Register error 202: internal parameter check failed, treated as a hard error.
    map.set(202, new ErrorExplain(202, $r('app.string.fr_err_202_title'), $r('app.string.fr_err_202_reason'),
      $r('app.string.fr_err_202_suggestion'), 'error'));
    // Register error 401: parameter type mismatch, treated as a warning.
    map.set(401, new ErrorExplain(401, $r('app.string.fr_err_401_title'), $r('app.string.fr_err_401_reason'),
      $r('app.string.fr_err_401_suggestion'), 'warning'));
    // Register error 31100101: font not found.
    map.set(31100101, new ErrorExplain(31100101, $r('app.string.fr_err_31100101_title'),
      $r('app.string.fr_err_31100101_reason'), $r('app.string.fr_err_31100101_suggestion'), 'warning'));
    // Register error 31100102: font family already registered.
    map.set(31100102, new ErrorExplain(31100102, $r('app.string.fr_err_31100102_title'),
      $r('app.string.fr_err_31100102_reason'), $r('app.string.fr_err_31100102_suggestion'), 'warning'));
    // Register error 31100103: invalid font file signature.
    map.set(31100103, new ErrorExplain(31100103, $r('app.string.fr_err_31100103_title'),
      $r('app.string.fr_err_31100103_reason'), $r('app.string.fr_err_31100103_suggestion'), 'warning'));
    // Register error 31100104: font already installed, treated as informational.
    map.set(31100104, new ErrorExplain(31100104, $r('app.string.fr_err_31100104_title'),
      $r('app.string.fr_err_31100104_reason'), $r('app.string.fr_err_31100104_suggestion'), 'info'));
    // Register error 31100105: font file write failed.
    map.set(31100105, new ErrorExplain(31100105, $r('app.string.fr_err_31100105_title'),
      $r('app.string.fr_err_31100105_reason'), $r('app.string.fr_err_31100105_suggestion'), 'warning'));
    // Register error 31100106: font uninstall target not found.
    map.set(31100106, new ErrorExplain(31100106, $r('app.string.fr_err_31100106_title'),
      $r('app.string.fr_err_31100106_reason'), $r('app.string.fr_err_31100106_suggestion'), 'warning'));
    // Register error 31100107: font path is outside the allowed sandbox.
    map.set(31100107, new ErrorExplain(31100107, $r('app.string.fr_err_31100107_title'),
      $r('app.string.fr_err_31100107_reason'), $r('app.string.fr_err_31100107_suggestion'), 'warning'));
    // Register error 31100108: font family name is invalid.
    map.set(31100108, new ErrorExplain(31100108, $r('app.string.fr_err_31100108_title'),
      $r('app.string.fr_err_31100108_reason'), $r('app.string.fr_err_31100108_suggestion'), 'warning'));
    // Register error 31100109: font is still in use by the system.
    map.set(31100109, new ErrorExplain(31100109, $r('app.string.fr_err_31100109_title'),
      $r('app.string.fr_err_31100109_reason'), $r('app.string.fr_err_31100109_suggestion'), 'warning'));
    // Register error 31100110: internal font service failure, treated as a hard error.
    map.set(31100110, new ErrorExplain(31100110, $r('app.string.fr_err_31100110_title'),
      $r('app.string.fr_err_31100110_reason'), $r('app.string.fr_err_31100110_suggestion'), 'error'));
    // Register error 31100111: font service busy, treated as informational.
    map.set(31100111, new ErrorExplain(31100111, $r('app.string.fr_err_31100111_title'),
      $r('app.string.fr_err_31100111_reason'), $r('app.string.fr_err_31100111_suggestion'), 'info'));
    // Return the fully populated map.
    return map;
  }

  // Explains the given error code, falling back to a generic entry for unknown codes.
  static explain(code: number): ErrorExplain {
    // Look the code up in the prebuilt table.
    const found: ErrorExplain | undefined = ErrorCodeMap.errors.get(code);
    // Return the known entry when the code is registered.
    if (found !== undefined) {
      // The lookup hit a registered entry.
      return found;
    }
    // Build a generic explanation for codes that are not in the table.
    return new ErrorExplain(code, $r('app.string.fr_err_unknown_title', code),
      $r('app.string.fr_err_unknown_reason'), $r('app.string.fr_err_unknown_suggestion'), 'error');
  }
}
