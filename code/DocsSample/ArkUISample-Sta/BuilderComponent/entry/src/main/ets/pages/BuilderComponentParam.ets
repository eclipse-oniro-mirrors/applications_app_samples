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
// [Start BuilderComponentParam]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, TextAlign, FontWeight, State, PropRef } from '@kit.ArkUI';

// 引用传递类型是interface时才能触发UI刷新。
interface Tmp {
  name: string;
  age: number;
}

@Builder
function parentBuilder(params: Tmp) {
  Row() {
    Column() {
      Text(`parentBuilder===${params.name}===${params.age}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      // 将整个对象拆分开变成简单类型，属于按引用传递方式，更改属性能够触发UI刷新。
      HelloComponent({ childName: params.name, childAge: params.age })
    }
  }
}

@Component
struct HelloComponent {
  @PropRef childName: string = '';
  @PropRef childAge: number = 0;

  build() {
    Row() {
      Text(`HelloComponent===${this.childName}===${this.childAge}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Entry
@Component
struct ParentPage {
  @State nameValue: string = '张三';
  @State ageValue: number = 18;

  build() {
    Column() {
      parentBuilder({ name: this.nameValue, age: this.ageValue })
      Button('Click me')
        .onClick((e: ClickEvent) => {
          // 此处修改内容时，会引起HelloComponent处的变化
          this.nameValue = '李四';
          this.ageValue = 20;
        })
        .margin(10)
    }
    .height('100%')
    .width('100%')
  }
}

// [End BuilderComponentParam]

@Builder
export function builderComponentParam(): void {
  NavDestination() {
    ParentPage();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_component_param_title'))
}
