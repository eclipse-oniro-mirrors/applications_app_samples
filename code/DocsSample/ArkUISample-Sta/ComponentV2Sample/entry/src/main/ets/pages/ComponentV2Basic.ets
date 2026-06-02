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
// [Start ComponentV2Basic]
import { ComponentV2, Entry, Local, Column, Text, Button } from '@kit.ArkUI';

@ComponentV2 // 装饰器
struct ComponentDemo { // struct声明的数据结构
  @Local local: number = 1; // 声明为@Local的装饰器变量
  build() { // build定义的UI
    Column() {
      Text(`${this.local}`)
      Button('increment')
        .onClick(() => {
          this.local++;
        })
    }
  }
}
// [End ComponentV2Basic]

@Entry
@ComponentV2
struct ComponentV2BasicPage {
  @Local local: number = 1;

  build() {
    Column() {
      ComponentDemo();
    }
  }
}

@Builder
export function componentV2Basic(): void {
  NavDestination() {
    ComponentV2BasicPage();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.componentv2_basic_title'))
}
