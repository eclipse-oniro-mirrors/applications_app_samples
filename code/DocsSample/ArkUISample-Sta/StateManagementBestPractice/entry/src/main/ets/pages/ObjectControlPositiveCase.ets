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

import { NavDestination, $r, Button, ClickEvent, Color, Column, ComponentV2, Entry, ForEach, Local, ObservedV2, Param, Require, Row, Stack, Text, Trace } from '@kit.ArkUI';

// [Start object_control_positive_case]
import { Button, ClickEvent, Color, Column, ComponentV2, Entry, ForEach, Local, ObservedV2, Param, Require, Row, Stack, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class ClassA {
  @Trace prop1: number = 0;
  @Trace prop2: string = 'This is Prop2';
}

@ComponentV2
struct CompA {
  @Require @Param a: ClassA;
  private sizeFont: number = 30; // 私有变量不会执行渲染

  private isRenderText(): number {
    this.sizeFont++; // sizeFont改变时组件不会刷新，但是可以看到方法是在被调用的
    console.info('Text prop2 is rendered');
    return this.sizeFont;
  }

  build() {
    Column() {
      Text(this.a.prop2) // 当this.a.prop2的值改变时，会执行组件渲染
        .fontSize(this.isRenderText()) // 当Text组件刷新时，会执行isRenderText方法
    }
  }
}

@Entry
@ComponentV2
struct Page {
  @Local a: ClassA = new ClassA();

  build() {
    Row() {
      Column() {
        Text('Prop1: ' + this.a.prop1)
          .fontSize(50)
        CompA({ a: this.a })
        Button('Change prop1')
          .width(200)
          .onClick(() => {
            this.a.prop1 = this.a.prop1 + 1;
          })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
// [End object_control_positive_case]

@Builder
export function objectControlPositiveCaseBuilder(): void {
  NavDestination() {
    Page();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_control_positive_case_title'))
}
