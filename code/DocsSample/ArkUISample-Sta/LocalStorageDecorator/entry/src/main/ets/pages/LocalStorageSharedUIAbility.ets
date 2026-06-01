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
// [Start localStorage_page_five_share]
import { Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStorageLink, Row, Text } from '@kit.ArkUI';

// 预览器上不支持获取页面共享的LocalStorage实例。
@Entry({ useSharedStorage: true })
@Component
struct Index {
  // 可以使用@LocalStorageLink/LocalStoragePropRef与LocalStorage实例中的变量建立联系
  @LocalStorageLink('PropA') propA: int = 1;

  build() {
    Row() {
      Column() {
        Text(`${this.propA}`)
          .fontSize(50)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End localStorage_page_five_share]

@Builder
export function localStorageSharedUIAbility(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_shared_ui_ability_title'))
}