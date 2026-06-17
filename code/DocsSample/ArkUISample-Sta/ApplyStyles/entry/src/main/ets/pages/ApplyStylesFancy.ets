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

// [Start ApplyStylesFancy]
import { ClickEvent, Color, Column, CommonMethod, Component, Entry, Text, applyStyles, State } from '@kit.ArkUI';

// 定义在全局的Styles方法
function globalFancy  (instance: CommonMethod) {
  instance.width(150);
  instance.height(100);
  instance.backgroundColor(Color.Pink);
}

@Entry
@Component
struct FancyUse {
  @State heightValue: number = 100;
  // 定义在组件内的Styles方法
  fancy(instance: CommonMethod) {
    instance.width(200);
    instance.height(this.heightValue);
    instance.backgroundColor(Color.Yellow);
    instance.onClick((e: ClickEvent) => {
      this.heightValue = 200;
    });
  }

  build() {
    Column() {
      // 使用全局的Styles方法
      Text('FancyA')
        .applyStyles(globalFancy)
        .fontSize(30)
        .margin(10)
      // 使用组件内的Styles方法
      Text('FancyB')
        .applyStyles(this.fancy)
        .fontSize(30)
        .margin(10)
    }
    .width('100%')
  }
}
// [End ApplyStylesFancy]

@Builder
export function applyStylesFancy(): void {
  NavDestination() {
    FancyUse()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.apply_styles_fancy_title'))
}
