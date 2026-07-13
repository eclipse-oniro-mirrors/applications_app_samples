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
// [Start localStorage_page_six_local_storage]
import { Button, ClickEvent, Column, Component, Entry, Link, LocalStorage, LocalStorageLink, Row, State, Text } from '@kit.ArkUI';

let localStorage1: LocalStorage = new LocalStorage();
localStorage1.setOrCreate('PropA', 'PropA');
let storageFunc1 = (): LocalStorage => {
    return localStorage1;
}

let localStorage2: LocalStorage = new LocalStorage();
localStorage2.setOrCreate('PropB', 'PropB');

@Entry({storage: 'storageFunc1'})
@Component
struct Index {
  // 变量PropA和localStorage1中'PropA'的双向同步
  @LocalStorageLink('PropA') PropA: string = 'Hello World';
  @State count: number = 0;

  build() {
    Row() {
      Column() {
        Text(`PropA value is ${this.PropA}`)
          .fontSize(30)
          .margin(10)
        // 使用LocalStorage实例localStorage2
        Child({ count: this.count }, localStorage2)
      }
      .width('100%')
    }
  }
}


@Component
struct Child {
  @Link count: number;
  // 变量PropB和localStorage2中'PropB'的双向同步，如果localStorage2中没有'PropB'，则使用默认值'Hello World'
  @LocalStorageLink('PropB') PropB: string = 'Hello World';

  build() {
    Text(`PropB value is ${this.PropB}`)
      .fontSize(30)
      .margin(10)
  }
}
// [End localStorage_page_six_local_storage]

@Builder
export function localStorageComponent(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_component_title'))
}