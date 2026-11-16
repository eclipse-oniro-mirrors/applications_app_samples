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
 * @file entry/src/main/ets/model/PhoneNumberPlan.ets
 * 文件职责：国家/地区号码规划表，提供区号、本号长度与 E.164 组包解析。
 * 主要声明：CountryPlan、PhoneNumberPlan。
 */

/**
 * CountryPlan：单个国家或地区的号码规划。
 */
export interface CountryPlan {
  region: string;
  callingCode: string;
  lengths: number[];
}

/**
 * PhoneNumberPlan：号码规划查询与 E.164 编解码。
 */
export class PhoneNumberPlan {
  static readonly PLANS: CountryPlan[] = [
    { region: 'CN', callingCode: '+86', lengths: [11] },
    { region: 'US', callingCode: '+1', lengths: [10] },
    { region: 'CA', callingCode: '+1', lengths: [10] },
    { region: 'GB', callingCode: '+44', lengths: [10] },
    { region: 'JP', callingCode: '+81', lengths: [10] },
    { region: 'DE', callingCode: '+49', lengths: [10, 11] },
    { region: 'FR', callingCode: '+33', lengths: [9] },
    { region: 'IN', callingCode: '+91', lengths: [10] },
    { region: 'KR', callingCode: '+82', lengths: [9, 10] },
    { region: 'SG', callingCode: '+65', lengths: [8] },
    { region: 'AU', callingCode: '+61', lengths: [9] },
    { region: 'BR', callingCode: '+55', lengths: [10, 11] },
    { region: 'RU', callingCode: '+7', lengths: [10] },
    { region: 'HK', callingCode: '+852', lengths: [8] },
    { region: 'TW', callingCode: '+886', lengths: [9] }
  ];

  /**
   * findPlan：按地区代码查找规划，地区代码大小写不敏感。
   * @param region 地区代码，如 CN。
   * @returns 命中返回规划，否则返回 undefined。
   */
  static findPlan(region: string): CountryPlan | undefined {
    const upper: string = region.trim().toUpperCase();
    for (let index = 0; index < PhoneNumberPlan.PLANS.length; index++) {
      if (PhoneNumberPlan.PLANS[index].region === upper) {
        return PhoneNumberPlan.PLANS[index];
      }
    }
    return undefined;
  }

  /**
   * callingCode：返回地区对应的国际区号。
   * @param region 地区代码。
   * @returns 区号文本，未知地区返回空串。
   */
  static callingCode(region: string): string {
    const plan: CountryPlan | undefined = PhoneNumberPlan.findPlan(region);
    return plan === undefined ? '' : plan.callingCode;
  }

  /**
   * regionOf：返回国际区号对应的第一个地区。
   * @param code 国际区号，可省略加号。
   * @returns 地区代码，未知区号返回空串。
   */
  static regionOf(code: string): string {
    const normalized: string = code.startsWith('+') ? code : '+' + code;
    for (let index = 0; index < PhoneNumberPlan.PLANS.length; index++) {
      if (PhoneNumberPlan.PLANS[index].callingCode === normalized) {
        return PhoneNumberPlan.PLANS[index].region;
      }
    }
    return '';
  }

  /**
   * isValidLength：校验本号长度是否符合地区规划。
   * @param region 地区代码。
   * @param digits 本号纯数字。
   * @returns 是否合规，未知地区返回 false。
   */
  static isValidLength(region: string, digits: string): boolean {
    const plan: CountryPlan | undefined = PhoneNumberPlan.findPlan(region);
    if (plan === undefined) {
      return false;
    }
    for (let index = 0; index < plan.lengths.length; index++) {
      if (plan.lengths[index] === digits.length) {
        return true;
      }
    }
    return false;
  }

  /**
   * e164：把地区与本号拼成 E.164 文本。
   * @param region 地区代码。
   * @param digits 本号纯数字。
   * @returns E.164 文本；地区未知时返回空串。
   */
  static e164(region: string, digits: string): string {
    const code: string = PhoneNumberPlan.callingCode(region);
    if (code === '' || digits.length === 0) {
      return '';
    }
    return code + digits;
  }

  /**
   * parseE164：把 E.164 文本拆成地区与本号。
   * @param text E.164 文本，必须以加号开头。
   * @returns 第一项为地区，第二项为本号；无法解析时两项为空串。
   */
  static parseE164(text: string): string[] {
    if (!text.startsWith('+')) {
      return ['', ''];
    }
    let best: CountryPlan | undefined = undefined;
    for (let index = 0; index < PhoneNumberPlan.PLANS.length; index++) {
      const plan: CountryPlan = PhoneNumberPlan.PLANS[index];
      if (text.startsWith(plan.callingCode)) {
        if (best === undefined || plan.callingCode.length > best.callingCode.length) {
          best = plan;
        }
      }
    }
    if (best === undefined) {
      return ['', ''];
    }
    const national: string = text.substring(best.callingCode.length);
    if (!PhoneNumberPlan.isValidLength(best.region, national)) {
      return ['', ''];
    }
    return [best.region, national];
  }

  /**
   * supportedRegions：返回全部支持的地区代码。
   * @returns 地区代码数组。
   */
  static supportedRegions(): string[] {
    const result: string[] = [];
    for (let index = 0; index < PhoneNumberPlan.PLANS.length; index++) {
      result.push(PhoneNumberPlan.PLANS[index].region);
    }
    return result;
  }
}
