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
 * @file entry/src/main/ets/model/DialValidator.ets
 * 文件职责：拨号输入的合法性校验与紧急号码识别。
 * 主要声明：ValidationResult、EmergencyDirectory、DialValidator。
 */

/**
 * ValidationResult：校验结果。
 */
export interface ValidationResult {
  ok: boolean;
  reason: string;
}

/**
 * EmergencyDirectory：按地区维护紧急号码及其语义。
 */
export class EmergencyDirectory {
  public static readonly CHINA: string[] = ['110', '119', '120', '122'];
  public static readonly UNITED_STATES: string[] = ['911'];
  public static readonly UNITED_KINGDOM: string[] = ['999', '112'];
  public static readonly JAPAN: string[] = ['110', '119'];
  public static readonly GERMANY: string[] = ['110', '112'];
  public static readonly FRANCE: string[] = ['15', '17', '18', '112'];
  public static readonly INDIA: string[] = ['100', '101', '102', '112'];
  public static readonly KOREA: string[] = ['112', '119'];
  public static readonly SINGAPORE: string[] = ['999', '995'];
  public static readonly AUSTRALIA: string[] = ['000', '112'];

  /**
   * byRegion：返回地区紧急号码列表。
   * @param region 地区代码。
   * @returns 紧急号码数组，未知地区返回空数组。
   */
  static byRegion(region: string): string[] {
    const upper: string = region.trim().toUpperCase();
    if (upper === 'CN') {
      return EmergencyDirectory.CHINA;
    }
    if (upper === 'US') {
      return EmergencyDirectory.UNITED_STATES;
    }
    if (upper === 'GB') {
      return EmergencyDirectory.UNITED_KINGDOM;
    }
    if (upper === 'JP') {
      return EmergencyDirectory.JAPAN;
    }
    if (upper === 'DE') {
      return EmergencyDirectory.GERMANY;
    }
    if (upper === 'FR') {
      return EmergencyDirectory.FRANCE;
    }
    if (upper === 'IN') {
      return EmergencyDirectory.INDIA;
    }
    if (upper === 'KR') {
      return EmergencyDirectory.KOREA;
    }
    if (upper === 'SG') {
      return EmergencyDirectory.SINGAPORE;
    }
    if (upper === 'AU') {
      return EmergencyDirectory.AUSTRALIA;
    }
    return [];
  }

  /**
   * containsNumber：判断号码是否属于该地区的紧急号码。
   * @param region 地区代码。
   * @param number 号码。
   * @returns 是否命中。
   */
  static containsNumber(region: string, number: string): boolean {
    const list: string[] = EmergencyDirectory.byRegion(region);
    for (let index = 0; index < list.length; index++) {
      if (list[index] === number) {
        return true;
      }
    }
    return false;
  }

  /**
   * describe：返回紧急号码语义。
   * @param number 号码。
   * @returns police、fire、ambulance、generic 之一；未知号码返回 unknown。
   */
  static describe(number: string): string {
    if (number === '110' || number === '17' || number === '100') {
      return 'police';
    }
    if (number === '119' || number === '18' || number === '101') {
      return 'fire';
    }
    if (number === '120' || number === '15' || number === '102' || number === '995') {
      return 'ambulance';
    }
    if (number === '122' || number === '911' || number === '999' || number === '112' || number === '000') {
      return 'generic';
    }
    return 'unknown';
  }
}

/**
 * DialValidator：拨号输入校验。
 */
export class DialValidator {
  public static readonly REASON_OK: string = 'OK';
  public static readonly REASON_EMPTY: string = 'EMPTY';
  public static readonly REASON_INVALID_CHAR: string = 'INVALID_CHAR';
  public static readonly REASON_TOO_LONG: string = 'TOO_LONG';
  public static readonly REASON_TOO_SHORT: string = 'TOO_SHORT';

  /**
   * isEmergency：判断输入是否为任意地区的紧急号码。
   * @param input 输入号码。
   * @returns 是否紧急号码。
   */
  static isEmergency(input: string): boolean {
    const regions: string[] = ['CN', 'US', 'GB', 'JP', 'DE', 'FR', 'IN', 'KR', 'SG', 'AU'];
    const value: string = input.trim();
    for (let index = 0; index < regions.length; index++) {
      if (EmergencyDirectory.containsNumber(regions[index], value)) {
        return true;
      }
    }
    return false;
  }

  /**
   * hasInvalidChar：判断输入是否包含数字与加号以外的字符。
   * @param input 输入号码。
   * @returns 是否含非法字符。
   */
  static hasInvalidChar(input: string): boolean {
    if (input.length === 0) {
      return false;
    }
    if (input.charAt(0) === '+') {
      for (let index = 1; index < input.length; index++) {
        const ch: string = input.charAt(index);
        if (ch < '0' || ch > '9') {
          return true;
        }
      }
      return false;
    }
    for (let index = 0; index < input.length; index++) {
      const ch: string = input.charAt(index);
      if (ch < '0' || ch > '9') {
        return true;
      }
    }
    return false;
  }

  /**
   * validate：校验输入，紧急号码不受本地长度下限约束。
   * @param input 输入号码。
   * @returns 校验结果。
   */
  static validate(input: string): ValidationResult {
    const value: string = input.trim();
    if (value.length === 0) {
      return { ok: false, reason: DialValidator.REASON_EMPTY };
    }
    if (DialValidator.hasInvalidChar(value)) {
      return { ok: false, reason: DialValidator.REASON_INVALID_CHAR };
    }
    if (DialValidator.isEmergency(value)) {
      return { ok: true, reason: DialValidator.REASON_OK };
    }
    if (value.startsWith('+')) {
      const digits: number = value.length - 1;
      if (digits > 15) {
        return { ok: false, reason: DialValidator.REASON_TOO_LONG };
      }
      if (digits < 7) {
        return { ok: false, reason: DialValidator.REASON_TOO_SHORT };
      }
      return { ok: true, reason: DialValidator.REASON_OK };
    }
    if (value.length > 11) {
      return { ok: false, reason: DialValidator.REASON_TOO_LONG };
    }
    if (value.length < 3) {
      return { ok: false, reason: DialValidator.REASON_TOO_SHORT };
    }
    return { ok: true, reason: DialValidator.REASON_OK };
  }

  /**
   * describeReason：把校验原因转换为可展示的英文说明。
   * @param reason 校验原因。
   * @returns 说明文本。
   */
  static describeReason(reason: string): string {
    if (reason === DialValidator.REASON_OK) {
      return 'ready to dial';
    }
    if (reason === DialValidator.REASON_EMPTY) {
      return 'number is empty';
    }
    if (reason === DialValidator.REASON_INVALID_CHAR) {
      return 'number contains invalid character';
    }
    if (reason === DialValidator.REASON_TOO_LONG) {
      return 'number is too long';
    }
    if (reason === DialValidator.REASON_TOO_SHORT) {
      return 'number is too short';
    }
    return 'unknown reason';
  }
}
