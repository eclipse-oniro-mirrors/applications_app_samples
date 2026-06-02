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
// [Start BuilderInCustomComponent]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, TextAlign, State } from '@kit.ArkUI';

@Entry
@Component
struct PrivateBuilder {
  @State builder_value: string = 'Hello';

  @Builder
  builder() {
    Column() {
      Text(this.builder_value)
        .width(230)
        .height(40)
        .backgroundColor('#ffeae5e5')
        .borderRadius(20)
        .margin(12)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear(): void {
    setTimeout(() => {
      this.builder_value = 'Hello World';
    }, 2000);
  }

  build() {
    Row() {
      Column() {
        Text(this.builder_value)
          .width(230)
          .height(40)
          .backgroundColor('#ffeae5e5')
          .borderRadius(20)
          .textAlign(TextAlign.Center)
        this.builder()
        Button('点击改变builder_value内容')
          .onClick((e: ClickEvent) => {
            this.builder_value = 'builder_value被点击了';
          })
      }
      .height('100%')
      .width('100%')
    }
  }
}

// [End BuilderInCustomComponent]

@Builder
export function builderInCustomComponent(): void {
  NavDestination() {
    PrivateBuilder();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_in_custom_component_title'))
}
