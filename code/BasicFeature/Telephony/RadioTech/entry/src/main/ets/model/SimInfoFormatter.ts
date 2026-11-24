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

export class SimInfoFormatter {
  public static readonly NOT_AVAILABLE: string = 'not available';
  public static readonly COUNTRY_CODE_PATTERN: RegExp = new RegExp('^[A-Za-z]{2}$');

  public static sanitize(text: string): string {
    return text.replace(new RegExp('[\\r\\n\\t]', 'g'), ' ');
  }

  public static formatSpn(value: string): string {
    if (value === undefined || value === null) {
      return SimInfoFormatter.NOT_AVAILABLE;
    }
    const cleaned: string = SimInfoFormatter.sanitize(value).trim();
    if (cleaned.length === 0) {
      return SimInfoFormatter.NOT_AVAILABLE;
    }
    return cleaned;
  }

  public static formatIsoCountryCode(value: string): string {
    if (value === undefined || value === null) {
      return SimInfoFormatter.NOT_AVAILABLE;
    }
    const trimmed: string = value.trim();
    if (!SimInfoFormatter.COUNTRY_CODE_PATTERN.test(trimmed)) {
      return SimInfoFormatter.NOT_AVAILABLE;
    }
    return trimmed.toUpperCase();
  }

  public static formatRadioOn(value: boolean): string {
    return value ? 'true' : 'false';
  }
}
