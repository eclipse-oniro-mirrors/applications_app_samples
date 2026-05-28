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
// [Start LocalStorageLinkSync]
import { Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStorageLink, Row, SubscribedAbstractProperty, Text } from '@kit.ArkUI';

// 构造LocalStorage实例
let para: Record<string, Any> = { 'PropA': 47 };
let storageA: LocalStorage = new LocalStorage(para);
let storageFunc = (): LocalStorage => {
  return storageA;
}

// linkToPropA 是全局变量
let linkToPropA: SubscribedAbstractProperty<int> = storageA.link<int>('PropA')!;

@Entry({storage: 'storageFunc'})
@Component
struct Parent {

  // @LocalStorageLink('PropA')在Parent自定义组件中创建'PropA'的双向同步数据，初始值为47，因为在构造LocalStorage已经给“PropA”设置47
  @LocalStorageLink('PropA') storageLink: int = 1;

  build() {
    Column() {
      // 点击“incr @LocalStorageLink variable”，this.storageLink加1，改变同步回storage，全局变量linkToPropA也会同步改变
      Button(`incr @LocalStorageLink variable`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.storageLink += 1;
        })

      // 并不建议在组件内使用全局变量linkToPropA.get()，因为可能会有生命周期不同引起的错误。
      Text(`@LocalStorageLink: ${this.storageLink} - linkToPropA: ${linkToPropA.get()}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}
// [End LocalStorageLinkSync]

@Builder
export function localStorageLinkSync(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_link_sync_title'))
}