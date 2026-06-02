'use static'

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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start FreezePageRouter]
import { Button, Column, Component, Entry, StorageLink, Text, Watch } from '@kit.ArkUI';

@Entry
@Component
struct Page1 {
  @StorageLink('PropA') @Watch('first') storageLink: number = 47;

  first(propertyName: string) {
    console.info('first page ' + `${this.storageLink}`);
  }

  getValue(): number{
    console.info('first page getValue');
    return this.storageLink;
  }

  build() {
    Column() {
      Text(`From first Page ${this.getValue()}`).fontSize(50)
      Button('first page storageLink + 1').fontSize(30)
        .onClick(() => {
          this.storageLink += 1;
        })
      Button('go to next page').fontSize(30)
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/FreezePage2' });
        })
    }
  }
}
// [End FreezePageRouter]

@Builder
export function freezePageRouter(): void {
  NavDestination() {
    Page1();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_page_router_title'))
}
