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
// [Start localStorage_page_local_storage_link]
import { Button, ClickEvent, Column, Component, Entry, LocalStorageLink, LocalStoragePropRef, Row, Text } from '@kit.ArkUI';

@Component
struct StorageLinkComponent {
  @LocalStorageLink('LinkA') LinkA: number | null = null;
  @LocalStorageLink('LinkB') LinkB: number | undefined = undefined;

  build() {
    Column() {
      Text('@LocalStorageLink接口初始化，@LocalStorageLink取值')
        .fontSize(20)
        .margin(10)
      Button(`${this.LinkA}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 改变LinkA变量的值
          this.LinkA ? this.LinkA = null : this.LinkA = 1;
      })
      Button(`${this.LinkB}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 改变LinkB变量的值
          this.LinkB ? this.LinkB = undefined : this.LinkB = 1;
      })
    }
    .width('100%')
    .borderWidth(3)

  }
}

@Component
struct StoragePropComponent {
  @LocalStoragePropRef('PropA') PropA: number | null = null;
  @LocalStoragePropRef('PropB') PropB: number | undefined = undefined;

  build() {
    Column() {
      Text('@LocalStoragePropRef接口初始化，@LocalStoragePropRef取值')
        .fontSize(20)
        .margin(10)
      Button(`${this.PropA}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 改变PropA变量的值
          this.PropA ? this.PropA = null : this.PropA = 1;
      })
      Button(`${this.PropB}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 改变PropB变量的值
          this.PropB ? this.PropB = undefined : this.PropB = 1;
      })
    }
    .width('100%')
    .borderWidth(3)
  }
}

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        StorageLinkComponent()
        StoragePropComponent()
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End localStorage_page_local_storage_link]

@Builder
export function localStorageUnionType(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_union_type_title'))
}