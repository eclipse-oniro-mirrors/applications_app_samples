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

// [Start RememberBasicType]
import { rememberVariable, MutableVariable, Entry, Component, Column, Text,
         Builder, Button, ColumnOptions } from '@kit.ArkUI';

@Builder
function BasicTypeBuilder() {
  let message: MutableVariable<string> = rememberVariable<string>('Hello world'); // 声明基础类型的状态变量，直接传入初始值。
  Text(`message: ${message.value}`) // 通过.value获取状态变量的值，绑定UI组件。
  Button('Change message in builder')
    .onClick(() => {
      message.value += '!'; // 通过.value修改状态变量，触发UI组件更新。
    })
}
@Entry
@Component
struct BasicTypePage {
  build() {
    Column({space: '10px'} as ColumnOptions) {
      BasicTypeBuilder()
    }.width('100%')
  }
}
// [End RememberBasicType]

@Builder
export function rememberBasicType(): void {
  NavDestination() {
    BasicTypePage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.remember_basic_type_title'))
}
