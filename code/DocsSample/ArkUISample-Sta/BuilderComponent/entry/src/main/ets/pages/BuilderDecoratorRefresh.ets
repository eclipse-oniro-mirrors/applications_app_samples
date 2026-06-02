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
// [Start BuilderDecoratorRefresh]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, TextAlign, ForEach, ListItem, State, Observed } from '@kit.ArkUI';

interface Tmp {
  str_value: string;
}

@Entry
@Component
struct Parent {
  @State objParam: Tmp = { str_value: 'Hello' } as Tmp;
  @State label: string = 'World';

  @Builder
  privateBuilder() {
    Column() {
      Text(`wrapBuilder str_value: ${this.objParam.str_value}`)
        .width(350)
        .height(40)
        .margin(12)
        .backgroundColor('#0d000000')
        .fontColor('#e6000000')
        .borderRadius(20)
        .textAlign(TextAlign.Center)
      Text(`wrapBuilder num: ${this.label}`)
        .width(350)
        .height(40)
        .margin(12)
        .backgroundColor('#0d000000')
        .fontColor('#e6000000')
        .borderRadius(20)
        .textAlign(TextAlign.Center)
    }
  }

  build() {
    Column() {
      Text('通过调用@Builder渲染UI界面')
        .fontSize(20)
      this.privateBuilder()
      Button('点击改变参数值').onClick((e: ClickEvent) => {
        this.objParam.str_value = 'str_value Hello World';
        this.label = 'label Hello World';
      })
    }
    .height('100%')
    .width('100%')
  }
}

// [End BuilderDecoratorRefresh]

@Builder
export function builderDecoratorRefresh(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_decorator_refresh_title'))
}
