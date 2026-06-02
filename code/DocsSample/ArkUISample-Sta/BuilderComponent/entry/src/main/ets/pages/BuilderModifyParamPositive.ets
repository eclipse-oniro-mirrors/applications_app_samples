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
// [Start BuilderModifyParamPositive]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, TextAlign, ListItem, FontWeight, State } from '@kit.ArkUI';

// 引用传递类型是interface时才能触发UI刷新。
interface Temp {
  paramA: string;
}

@Builder
function overBuilder(param: Temp) {
  Row() {
    Column() {
      Button(`overBuilder === ${param.paramA}`)
    }
  }
}

@Entry
@Component
struct Parent {
  @State label: string = 'Hello';

  build() {
    Column() {
      overBuilder({paramA: this.label} as Temp)
      Button('click me')
        .onClick((e: ClickEvent) => {
          this.label = 'ArkUI';
        })
    }
  }
}

// [End BuilderModifyParamPositive]

@Builder
export function builderModifyParamPositive(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_modify_param_positive_title'))
}
