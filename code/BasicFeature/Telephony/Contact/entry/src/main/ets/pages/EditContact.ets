/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import prompt from '@ohos.promptAction';
import contact from '@ohos.contact';
import Logger from '../data/Logger';
import { UpdateContact } from '../component/UpdateContact';
import { PhoneNumberValidator } from '../utils/PhoneNumberValidator';

const TAG: string = '[Sample_Contact]';

interface EditContactParams {
  data?: contact.Contact;
}

function getContactParam(): contact.Contact {
  let params: EditContactParams = router.getParams() as EditContactParams;
  let data: contact.Contact | undefined = params.data;
  if (data !== undefined) {
    return data;
  }
  let fallback: contact.Contact = { name: { fullName: '' } };
  return fallback;
}

@Entry
@Component
struct EditContact {
  @State contactId: number = 0
  @State name: string = ''
  @State email: string = ''
  @State nickName: string = ''
  @State phoneNumber: string = ''
  @State postalAddress: string = ''
  @State contact: contact.Contact = getContactParam()

  build() {
    Column() {
      Row() {
        Image($r('app.media.no'))
          .id('cancelEdit')
          .width(32)
          .height(32)
          .margin({ left: 32, right: 22 })
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            router.back();
          });

        Text($r('app.string.editor_contact'))
          .fontSize(26)
          .fontWeight(400)
          .textAlign(TextAlign.End)
          .fontColor(Color.Black);

        Blank();

        Image($r('app.media.yes'))
          .id('confirmEdit')
          .width(32)
          .height(32)
          .margin({ right: 32 })
          .objectFit(ImageFit.Contain)
          .onClick(async () => {
            Logger.info(TAG, `this number is ${this.phoneNumber} this test result ` +
              `${PhoneNumberValidator.isValid(this.phoneNumber)}`);
            if (PhoneNumberValidator.isValid(this.phoneNumber) === true) {
              let contacts: contact.Contact = {
                id: this.contactId,
                name: { fullName: this.name },
                nickName: { nickName: this.nickName },
                phoneNumbers: [{ phoneNumber: this.phoneNumber }],
                emails: [{ email: this.email }],
                postalAddresses: [{ postalAddress: this.postalAddress }]
              };
              await contact.updateContact(contacts);
              router.replaceUrl({
                url: 'pages/Index'
              });
              router.clear();
            } else {
              prompt.showToast({
                message: $r('app.string.phone_number_invalid'),
                duration: 2000,
              });
            }
          });
      }
      .height('6%')
      .width('100%')
      .margin({ top: 32 })
      .constraintSize({ minHeight: 50 });

      UpdateContact({
        name: $name,
        phoneNumber: $phoneNumber,
        nickName: $nickName,
        email: $email,
        postalAddress: $postalAddress
      });
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.add_contact_bg'));
  }

  aboutToAppear(): void {
    let contactName: contact.Name | undefined = this.contact.name;
    this.name = contactName === undefined ? '' : contactName.fullName;
    try {
      let contactId: number | undefined = this.contact.id;
      this.contactId = contactId === undefined ? 0 : contactId;
    } catch (err) {
      this.contactId = 0;
    }
    try {
      let contactNick: contact.NickName | undefined = this.contact.nickName;
      this.nickName = contactNick === undefined ? '' : contactNick.nickName;
    } catch (err) {
      this.nickName = '';
    }
    let phoneNumbers: contact.PhoneNumber[] | undefined = this.contact.phoneNumbers;
    if (phoneNumbers !== undefined && phoneNumbers.length > 0) {
      let first: contact.PhoneNumber | undefined = phoneNumbers[0];
      this.phoneNumber = first === undefined ? '' : first.phoneNumber;
    }
    let emails: contact.Email[] | undefined = this.contact.emails;
    if (emails !== undefined && emails.length > 0) {
      let first: contact.Email | undefined = emails[0];
      this.email = first === undefined ? '' : first.email;
    }
    let postalAddresses: contact.PostalAddress[] | undefined = this.contact.postalAddresses;
    if (postalAddresses !== undefined && postalAddresses.length > 0) {
      let first: contact.PostalAddress | undefined = postalAddresses[0];
      this.postalAddress = first === undefined ? '' : first.postalAddress;
    }
  }
}