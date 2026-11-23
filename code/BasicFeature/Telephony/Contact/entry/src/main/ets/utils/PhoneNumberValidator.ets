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
 * 手机号校验规则（与 AddContact/EditContact 页面内联规则逐字一致）：
 * 前缀须为 13x/14[01456879]/15[0-35-9]/16[2567]/17[0-8]/18x/19[0-35-9] 之一，后跟 8 位数字。
 * 注意：正则未做行尾锚定，test() 为前缀匹配语义，超出 11 位的数字串只要前缀合法同样通过。
 */
export class PhoneNumberValidator {
  static isValid(phoneNumber: string): boolean {
    const TEST_RULER: RegExp = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}/;
    return TEST_RULER.test(phoneNumber);
  }
}
