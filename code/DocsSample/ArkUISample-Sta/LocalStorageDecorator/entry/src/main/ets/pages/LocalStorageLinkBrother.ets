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
// [Start LocalStorageLinkBrother]
import { Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStorageLink, Row, Text } from '@kit.ArkUI';

let count: Record<string, Any> = { 'countStorage': 1 };
let storageA: LocalStorage = new LocalStorage(count);
let storageFunc = (): LocalStorage => {
  return storageA;
}

@Component
struct Child {
  // 子组件实例的名字
  label: string = 'no name';
  // 和LocalStorage中“countStorage”的双向绑定数据
  @LocalStorageLink('countStorage') playCountLink: int = 0;

  build() {
    Column() {
      Text(this.label)
        .fontSize(20)
        .margin(10)
      Button(`playCountLink ${this.playCountLink}: inc by 1`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.playCountLink += 1;
        })
    }
    .width(300)
  }
}

@Entry({storage: 'storageFunc'})
@Component
struct Parent {
  @LocalStorageLink('countStorage') playCount: int = 0;

  build() {
    Column() {
      Text('Parent')
        .fontSize(20)
        .margin(10)
      Button(`playCount ${this.playCount} dec by 1`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.playCount -= 1;
        })

      Text('LocalStorage')
        .fontSize(20)
        .margin(10)
      Button(`countStorage ${this.playCount} incr by 1`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          storageA.set<int>('countStorage', storageA.get<int>('countStorage')! + 1);
        })

      Child({ label: 'ChildA' })
      Child({ label: 'ChildB' })

      Text(`playCount in LocalStorage for debug ${storageA.get<int>('countStorage')}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}
// [End LocalStorageLinkBrother]

@Builder
export function localStorageLinkBrother(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_link_brother_title'))
}