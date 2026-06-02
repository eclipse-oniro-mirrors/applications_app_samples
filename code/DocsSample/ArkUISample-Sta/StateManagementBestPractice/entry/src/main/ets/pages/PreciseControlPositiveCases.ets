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

import { NavDestination, $r, Button, ClickEvent, Color, Column, ComponentV2, Entry, ForEach, Image, Local, ObservedV2, Param, Require, Row, Stack, Text, Trace } from '@kit.ArkUI';

// [Start precise_control_positive_cases]
import { $r, Button, ClickEvent, Color, Column, ComponentV2, Entry, ForEach, Image, Local, ObservedV2, Param, Require, Row, Stack, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Translate {
  @Trace translateX: number = 20;
}
@ComponentV2
struct Title {
  build() {
    Row() {
      // 此处'app.media.startIcon'仅作示例，请开发者自行替换，否则imageSource创建失败会导致后续无法正常执行
      Image($r('app.media.startIcon'))
        .width(50)
        .height(50)
      Text('Title')
        .fontSize(20)
    }
  }
}
@Entry
@ComponentV2
struct Page1 {
  @Local translateObj: Translate = new Translate();

  build() {
    Column() {
      Title()
      Stack() {
      }
      .backgroundColor('black')
      .width(200)
      .height(400)
      Button('move')
        .onClick(() => {
          this.getUIContext().animateTo({
            duration: 50
          },()=>{
            this.translateObj.translateX = (this.translateObj.translateX + 50) % 150;
          })
        })
    }
    .translate({ // 子组件Stack和Button设置了同一个translate属性，可以统一到Column上设置
      x: this.translateObj.translateX
    })
  }
}
// [End precise_control_positive_cases]

@Builder
export function preciseControlPositiveCasesBuilder(): void {
  NavDestination() {
    Page1();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.precise_control_positive_cases_title'))
}
