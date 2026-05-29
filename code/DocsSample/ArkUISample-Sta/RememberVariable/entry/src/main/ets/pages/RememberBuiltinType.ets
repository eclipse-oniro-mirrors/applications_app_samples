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

// [Start RememberBuiltinType]
import { rememberVariable, MutableVariable, UIUtils, Entry, Component, Column,
         Text, Builder, Button, ColumnOptions } from '@kit.ArkUI';

@Builder
function BuiltinTypeBuilder() {
  let messages: MutableVariable<string[]> = rememberVariable<string[]>(
    () => UIUtils.makeObserved(['Hello world']));
  Text(`messages: ${messages.value}`)
  Button('Change messages in builder')
    .onClick(() => {
      messages.value.push('Hello ArkTS');
    })
}
@Entry
@Component
struct BuiltinTypePage {
  build() {
    Column({space: '10px'} as ColumnOptions) {
      BuiltinTypeBuilder()
    }.width('100%')
  }
}
// [End RememberBuiltinType]

@Builder
export function rememberBuiltinType(): void {
  NavDestination() {
    BuiltinTypePage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.remember_builtin_type_title'))
}
