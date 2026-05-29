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

// [Start RememberPassVariable]
import { rememberVariable, MutableVariable, UIUtils, Entry, Component, Column,
         Text, Builder, Button, ColumnOptions } from '@kit.ArkUI';

@Builder
function PassChildBuilder(message: MutableVariable<string>) {
  Text(`My Child builder is: ${message.value}`)
  Button('Change message in child builder')
    .onClick(() => {
      message.value += '!';
    })
}

@Builder
function PassParentBuilder() {
  let message: MutableVariable<string> = rememberVariable<string>('Hello world');
  Text(`My parent builder is ${message.value}`)
  PassChildBuilder(message)
}

@Entry
@Component
struct PassVariablePage {
  build() {
    Column({space: '10px'} as ColumnOptions) {
      PassParentBuilder()
    }.width('100%')
  }
}
// [End RememberPassVariable]

@Builder
export function rememberPassVariable(): void {
  NavDestination() {
    PassVariablePage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.remember_pass_variable_title'))
}
