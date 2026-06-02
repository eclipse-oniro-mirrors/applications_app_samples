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
// [Start BuilderByReference]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, State, FontWeight, TextAlign } from '@kit.ArkUI';

// 引用传递类型是interface才能触发UI刷新。
interface Tmp {
  paramA1: string;
}

@Builder
function overBuilder(params: Tmp) {
  Row() {
    Text(`UseStateVarByReference: ${params.paramA1}`)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Center)
  }
}

@Entry
@Component
struct Parent {
  @State label: string = 'Hello';

  build() {
    Column() {
      // 在父组件中调用overBuilder组件时，
      // 把this.label通过引用传递的方式传给overBuilder组件。
      overBuilder({ paramA1: this.label })
      Button('Click me').onClick((e: ClickEvent) => {
        // 单击Click me后，UI文本从Hello更改为ArkUI。
        this.label = 'ArkUI';
      })
    }
  }
}

// [End BuilderByReference]

@Builder
export function builderByReference(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_by_reference_title'))
}
