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
// [Start FreezePageRouter1]
import { Button, ClickEvent, Column, ComponentV2, Entry, IMonitor, Local, Monitor, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
export class Book {
  @Trace name: string = '100';

  constructor(page: string) {
    this.name = page;
  }
}

@Entry
@ComponentV2
struct Page1 {
  @Local bookTest: Book = new Book(`A Midsummer Night's Dream`);

  @Monitor(['bookTest.name']) onMessageUpdated(mon: IMonitor) {
    console.info(`The book name change from ${mon.value<string>()?.before} to ${mon.value<string>()?.now}`);
  }

  build() {
    Column() {
      Text(`Book name is  ${this.bookTest.name}`)
        .fontSize(25)
        .margin(10)
      Button('changeBookName')
        .fontSize(25)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.bookTest.name = 'The Old Man and the Sea'; // 会立刻触发@Monitor
        })
      Button('go to next page')
        .fontSize(25)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/FreezePage2' });
          setTimeout(() => {
            this.bookTest = new Book(`Jane Austen's Pride and Prejudice`); // 从Page2返回Page1后触发@Monitor
          }, 1000);
        })
    }
    .width('100%')
  }
}
// [End FreezePageRouter1]

@Builder
export function freezePage1(): void {
  NavDestination() {
    Page1();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_page_router_title'))
}
