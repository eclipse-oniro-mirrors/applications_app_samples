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

import contact from '@ohos.contact'

/**
 * 联系人字段提取规则（与 ContactInfo.getItemFirstPhone、ItemContainer.getFirstLetter/differsFromPrevious、
 * Contact.queryContact 的取值表达式逐字一致）：
 * - fullName：name 缺失时返回空串
 * - firstLetter：全名首字符（含大小写归一），空名返回空串
 * - firstPhone：phoneNumbers 缺失或为空返回空串，否则取第 1 项号码
 * - letterDiffers：两名字首字符不同（大小写敏感，不做归一）
 */
export class ContactFieldExtractor {
  static fullName(contactInfo: contact.Contact): string {
    return contactInfo.name === undefined ? '' : contactInfo.name.fullName;
  }

  static firstLetter(contactInfo: contact.Contact): string {
    return ContactFieldExtractor.fullName(contactInfo).substr(0, 1).toUpperCase();
  }

  static firstPhone(contactInfo: contact.Contact): string {
    if (contactInfo.phoneNumbers === undefined || contactInfo.phoneNumbers.length === 0) {
      return '';
    }
    let first: contact.PhoneNumber | undefined = contactInfo.phoneNumbers[0];
    return first === undefined ? '' : first.phoneNumber;
  }

  static letterDiffers(previousName: string, itemName: string): boolean {
    return itemName.substr(0, 1) !== previousName.substr(0, 1);
  }
}
