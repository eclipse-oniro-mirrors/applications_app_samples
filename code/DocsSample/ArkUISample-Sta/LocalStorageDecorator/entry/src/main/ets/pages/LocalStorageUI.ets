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
// [Start LocalStorageUI]
import { Button, ClickEvent, Column, Component, Entry, LocalStorage, LocalStorageLink, Row, Text } from '@kit.ArkUI';

class Data {
  code: number;

  constructor(code: number) {
    this.code = code;
  }
}
// 创建新实例并使用给定对象初始化
let para: Record<string, Any> = { 'PropA': 47 };
let storageA: LocalStorage = new LocalStorage(para);
storageA.setOrCreate('PropB', new Data(50));
let storageFunc = (): LocalStorage => {
  return storageA;
}

// 静态ArkTS，@Entry只支持传入字符串，因次必须传入匿名函数
@Entry({storage: 'storageFunc'})
@Component
struct Parent {
  // @LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  @LocalStorageLink('PropA') parentLinkNumber: int = 1;
  // @LocalStorageLink变量装饰器与LocalStorage中的'PropB'属性建立双向绑定
  @LocalStorageLink('PropB') parentLinkObject: Data = new Data(0);

  build() {
    Column() {
      // 由于LocalStorage中PropA已经被初始化，因此this.parentLinkNumber的值为47
      Button(`Parent from LocalStorage ${this.parentLinkNumber}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.parentLinkNumber += 1;
        })
      // 由于LocalStorage中PropB已经被初始化，因此this.parentLinkObject.code的值为50
      // 类属性观测需要使用@Observed装饰class，因此不支持刷新
      Button(`Parent from LocalStorage ${this.parentLinkObject.code}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.parentLinkObject.code += 1;
        })
      // @Component子组件自动获得对Parent LocalStorage实例的访问权限
      Child()
    }
    .width('100%')
  }
}

@Component
struct Child {
  // @LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  @LocalStorageLink('PropA') childLinkNumber: int = 1;
  // @LocalStorageLink变量装饰器与LocalStorage中的'PropB'属性建立双向绑定
  @LocalStorageLink('PropB') childLinkObject: Data = new Data(0);

  build() {
    Column() {
      // 更改将同步至LocalStorage中的'PropA'以及Parent.parentLinkNumber
      Button(`Child from LocalStorage ${this.childLinkNumber}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.childLinkNumber += 1;
        })
      // 更改将同步至LocalStorage中的'PropB'以及Parent.parentLinkObject.code
      // 类属性观测需要使用@Observed装饰class，因此不支持刷新
      Button(`Child from LocalStorage ${this.childLinkObject.code}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.childLinkObject.code += 1;
        })
    }
    .width('100%')
  }
}
// [End LocalStorageUI]

@Builder
export function localStorageUI(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_storage_ui_title'))
}