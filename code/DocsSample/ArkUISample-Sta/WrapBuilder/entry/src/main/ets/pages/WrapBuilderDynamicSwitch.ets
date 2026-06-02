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
// [Start WrapBuilderDynamicSwitch]
import { Builder, Button, Column, ComponentV2, Entry, Text, WrappedBuilder, wrapBuilder, Local } from '@kit.ArkUI';

class TextContent {
  text: string = '';
}

@Builder
function textBuilder(p: TextContent) {
  Text(p.text)
    .margin(31)
}

@Builder
function buttonBuilder(p: TextContent) {
  Button(p.text)
    .margin(20)
}

let counter: number = 1;
@Entry
@ComponentV2
struct MyApp {
  @Local message: string = '';
  @Local switchingBuilder: WrappedBuilder<@Builder (p: TextContent) => void> = wrapBuilder(textBuilder);
  build() {
    Column() {
      Button('Click to change')
        .onClick(() => {
          counter++; // 每次点击按钮修改counter来动态改变全局@Builder
          if(counter % 2 === 0) {
            this.message += 'Hello';
            this.switchingBuilder = wrapBuilder(buttonBuilder); // textBuilder--->buttonBuilder
          } else {
            this.message += 'World';
            this.switchingBuilder = wrapBuilder(textBuilder); // buttonBuilder--->textBuilder
          }
        })
        this.switchingBuilder.builder({ text: this.message })
    }
    .position({x: 120, y: 60})
  }
}

// [End WrapBuilderDynamicSwitch]

@Builder
export function wrapBuilderDynamicSwitch(): void {
  NavDestination() {
    MyApp();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.wrapbuilder_dynamic_switch_title'))
}
