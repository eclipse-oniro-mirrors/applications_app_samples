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
// [Start FreezePage2]
import { Button, Column, Component, Entry, StorageLink, Text, Watch } from '@kit.ArkUI';

@Entry
@Component
struct Page2 {
  @StorageLink('PropA') @Watch('second') storageLink2: number = 1;

  second(propertyName: string) {
    console.info('second page: ' + `${this.storageLink2}`);
  }

  getValue(): number{
    console.info('second page getValue');
    return this.storageLink2;
  }

  build() {
    Column() {

      Text(`second Page ${this.getValue()}`).fontSize(50)
      Button('back')
        .onClick(() => {
          this.getUIContext().getRouter().back();
        })

      Button('second page storageLink2 + 2').fontSize(30)
        .onClick(() => {
          this.storageLink2 += 2;
        })
    }
  }
}
// [End FreezePage2]

@Builder
export function freezePage2(): void {
  NavDestination() {
    Page2();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_page2_title'))
}
