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
import contact from '@ohos.contact';
import { ContactFieldExtractor } from '../utils/ContactFieldExtractor';

@Component
export struct ItemContainer {
  @Link selected: number
  @State routerItem: number = 0
  @State letter: string = ''
  @Link contacts: contact.Contact[];
  private alphabetical: string[] =
    [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    ];

  build() {
    Column() {
      List({ space: 4, initialIndex: this.routerItem }) {
        ForEach(this.contacts, (item: contact.Contact, index: number) => {
          ListItem() {
            Column() {
              if (index === 0) {
                this.container(this.getFirstLetter(item));
              }
              else {
                if (this.differsFromPrevious(index, item)) {
                  this.container(this.getFirstLetter(item));
                }
              }
              Row() {
                Image($r('app.media.head'))
                  .width(52)
                  .height(52)
                  .borderRadius(90)
                  .margin({ left: 32 });

                Text(item.name === undefined ? '' : item.name.fullName)
                  .fontSize(20)
                  .margin({ left: 22 });
              }
              .id('contactList')
              .width('100%')
              .borderRadius(15)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/NameCard',
                  params: { data: item }
                });
              });
            }
            .width('100%');
          }
        }, (item: contact.Contact, index: number): string => index.toString());
      }
      .width('100%')
      .height('45%')
      .onScrollIndex((startIndex: number, lastIndex: number) => {
        if (this.contacts.length > 0) {
          let current: contact.Contact | undefined = this.contacts[startIndex];
          if (current !== undefined) {
            // 更新选中的字母索引
            this.letter = this.getFirstLetter(current);
            this.selected = this.alphabetical.indexOf(this.letter);
          }
        }
      });
    }
    .width('100%')
    .height('100%');
  }

  getFirstLetter(item: contact.Contact): string {
    return ContactFieldExtractor.firstLetter(item);
  }

  differsFromPrevious(index: number, item: contact.Contact): boolean {
    let previous: contact.Contact | undefined = this.contacts[index - 1];
    let previousName: string = previous === undefined || previous.name === undefined ? '' : previous.name.fullName;
    let itemName: string = item.name === undefined ? '' : item.name.fullName;
    return ContactFieldExtractor.letterDiffers(previousName, itemName);
  }

  @Builder container(text: string) {
    Row() {
      Text(text)
        .fontSize(24)
        .margin({ left: 32 });
    }
    .width('100%')
    .margin({ top: 32, bottom: 22 });
  }
}