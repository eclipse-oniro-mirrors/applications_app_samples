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
// [Start BuilderVariable]
import { Builder, Component, Column, Color, Entry, ForEach, Text, State } from '@kit.ArkUI';

@Builder
function MyBuilder(value: string, size: number) {
  Text(value).fontSize(size)
}

@Builder
function YourBuilder(value: string, size: number) {
  Text(value).fontSize(size).fontColor(Color.Pink)
}

let globalBuilder: @Builder (value: string, size: number) => void = MyBuilder; // 使用变量封装Builder函数
let builderArr: (@Builder (value: string, size: number) => void)[] = [MyBuilder, YourBuilder]; // 使用列表封装多个Builder函数

@Entry
@Component
struct Index {
  @State message: string = 'Hello world!';

  build() {
    Column() {
      globalBuilder(this.message, 50) // 使用Builder变量
      ForEach(builderArr, (builder: @Builder (value: string, size: number) => void) => { // 展开Builder列表
        builder(this.message, 30);
      })
    }
  }
}

// [End BuilderVariable]

@Builder
export function builderVariable(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_variable_title'))
}
