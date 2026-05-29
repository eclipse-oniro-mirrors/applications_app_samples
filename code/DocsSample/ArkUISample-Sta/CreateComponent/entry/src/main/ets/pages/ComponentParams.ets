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
// [Start ComponentParams]
import { Color, Column, Component, Entry, Text } from '@kit.ArkUI';

@Component
struct MyComponent {
  private countDownFrom: number = 0;
  private color: Color = Color.Blue;

  build() {
    Column() {
      Text(`countDownFrom: ${this.countDownFrom}`)
        .fontColor(this.color)
    }
  }
}

@Entry
@Component
struct ParentComponent {
  private someColor: Color = Color.Pink;

  build() {
    Column() {
      // 创建MyComponent实例，并将成员变量countDownFrom初始化为10，将成员变量color初始化为this.someColor。
      MyComponent({ countDownFrom: 10, color: this.someColor })
    }
  }
}
// [End ComponentParams]

@Builder
export function componentParams(): void {
  NavDestination() {
    ParentComponent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.component_params_title'))
}
