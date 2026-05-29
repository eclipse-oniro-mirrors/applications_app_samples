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

// [Start RememberInitFromState]
import { rememberVariable, MutableVariable, Entry, Component, Column, Text,
         Button, Builder, State, ColumnOptions } from '@kit.ArkUI';

@Entry
@Component
struct InitFromStatePage {
  @State source: string = 'Hello world';
  build() {
    Column({space: '10px'} as ColumnOptions) {
      // 创建新状态变量，只能继承初始值，不能同步数据
      let message: MutableVariable<string> = rememberVariable<string>(this.source);
      Text(message.value)
      Button('Change source')
        .onClick(() => {
          this.source += '!'; // 修改初始化状态变量没有同步功能，不能刷新UI
        })
      Button('Change message')
        .onClick(() => {
          message.value += '!'; //直接修改MutableVariable可以刷新UI
        })
    }.width('100%')
  }
}
// [End RememberInitFromState]

@Builder
export function rememberInitFromState(): void {
  NavDestination() {
    InitFromStatePage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.remember_init_from_state_title'))
}
