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

export interface RadioTechSnapshot {
  psRadioTech: number;
  csRadioTech: number;
}

export class RadioTechFormatter {
  public static readonly UNKNOWN: string = 'unknown';
  public static readonly NR: number = 12;
  public static readonly TECH_NAMES: string[] = [
    'unknown', 'gsm', '1xrtt', 'wcdma', 'hspa', 'hspap', 'td-scdma',
    'evdo', 'ehrpd', 'lte', 'lte-ca', 'iwlan', 'nr'
  ];

  public static isKnown(value: number): boolean {
    return Number.isInteger(value) && value >= 0 && value < RadioTechFormatter.TECH_NAMES.length;
  }

  public static techName(value: number): string {
    if (!RadioTechFormatter.isKnown(value)) {
      return RadioTechFormatter.UNKNOWN;
    }
    return RadioTechFormatter.TECH_NAMES[value];
  }

  public static isNr(value: number): boolean {
    return value === RadioTechFormatter.NR;
  }

  public static formatPair(psRadioTech: number, csRadioTech: number): string {
    return `ps:${RadioTechFormatter.techName(psRadioTech)},cs:${RadioTechFormatter.techName(csRadioTech)}`;
  }

  public static format(tech: RadioTechSnapshot): string {
    return RadioTechFormatter.formatPair(tech.psRadioTech, tech.csRadioTech);
  }
}
