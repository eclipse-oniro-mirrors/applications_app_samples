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
// [Start BuilderAsCustomBuilder]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, TextAlign, ForEach, ListItem, FontWeight, List, State } from '@kit.ArkUI';

@Builder
function overBuilder() {
  Row() {
    Text('全局 Builder')
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }
}

@Entry
@Component
struct CustomBuilderDemo {
  @State arr: int[] = [0, 1, 2, 3, 4];

  @Builder
  privateBuilder() {
    Row() {
      Text('局部 Builder')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.arr, (item: int) => {
          ListItem() {
            Text(`${item}`)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .swipeAction({
            start: {
              builder: overBuilder
            },
            end: {
              builder: () => {
                this.privateBuilder()
              }
            }
          })
        }, (item: int) => JSON.stringify(item))
      }
    }
  }
}

// [End BuilderAsCustomBuilder]

@Builder
export function builderAsCustomBuilder(): void {
  NavDestination() {
    CustomBuilderDemo();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_as_custom_builder_title'))
}
