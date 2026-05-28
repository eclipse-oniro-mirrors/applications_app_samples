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
// [Start ProvideConsumeUnion]
import { Button, ClickEvent, Column, Component, Consume, Entry, Provide, Row, Text } from '@kit.ArkUI';
@Component
struct Child {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Ancestors内@Provide装饰的变量
  @Consume count: string | undefined;

  build() {
    Column() {
      Text(`count(${this.count})`)
      Button(`count(${this.count}), Child`)
        .onClick((e: ClickEvent) => {
          this.count = 'Ancestors';
        })
    }
    .width('50%')
  }
}

@Component
struct Parent {
  build() {
    Row() {
      Child()
    }
  }
}

@Entry
@Component
struct Ancestors {
  // @Provide装饰的联合类型count由入口组件Ancestors提供其后代组件
  @Provide count: string | undefined = 'Child';

  build() {
    Column() {
      Button(`count(${this.count}), Child`)
        .onClick((e: ClickEvent) => {
          this.count = undefined;
        })
      Parent()
    }
  }
}
// [End ProvideConsumeUnion]

@Builder
export function provideConsumeUnion(): void {
  NavDestination() {
    Ancestors();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provide_consume_union_title'))
}