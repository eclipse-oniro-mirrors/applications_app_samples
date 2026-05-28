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
// [Start LocalStoragePropRef]
import { Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStoragePropRef, Row, Text } from '@kit.ArkUI';

// 创建新实例并使用给定对象初始化
let para: Record<string, Any> = { 'PropA': 47 };
let storageA: LocalStorage = new LocalStorage(para);
let storageFunc = (): LocalStorage => {
  return storageA;
}

// 使LocalStorage可从@Component组件访问
@Entry({storage: 'storageFunc'})
@Component
struct Parent {
  // @LocalStoragePropRef变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStoragePropRef('PropA') storageProp1: int = 1;

  build() {
    Column() {
      // 点击后从47开始加1，只改变当前组件显示的storageProp1，不会同步到LocalStorage中
      Button(`Parent from LocalStorage ${this.storageProp1}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.storageProp1 += 1;
        })
      Child()
    }
    .width('100%')
  }
}

@Component
struct Child {
  // @LocalStoragePropRef变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStoragePropRef('PropA') storageProp2: int = 2;

  build() {
    Column() {
      // 当Parent改变时，当前storageProp2不会改变，显示47
      Text(`Parent from LocalStorage ${this.storageProp2}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}
// [End LocalStoragePropRef]

@Builder
export function localStoragePropRef(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_prop_ref_title'))
}