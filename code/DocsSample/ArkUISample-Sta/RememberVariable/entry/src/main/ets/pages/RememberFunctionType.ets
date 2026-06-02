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

// [Start RememberFunctionType]
import { rememberVariable, MutableVariable, Entry, Component, Column,
         Text, Builder, Button, ColumnOptions } from '@kit.ArkUI';

function GetValueA() {
  return 'Hello World';
}
function GetValueB() {
  return 'Hello ArkTS';
}

@Builder
function FunctionTypeBuilder() {
  // 声明Function类型的状态变量
  let getValueFunction: MutableVariable<Function> = rememberVariable<Function>(() => GetValueA);
  Text(`My value is ${ getValueFunction.value.unsafeCall() }`) // 使用unsafeCall调用Function
  Button('Change function in builder')
    .onClick(() => {
      if (getValueFunction.value === GetValueA) {
        // 修改Function类型状态变量，会触发UI刷新。
        getValueFunction.value = GetValueB;
      } else {
        getValueFunction.value = GetValueA;
      }
    })
}
@Entry
@Component
struct FunctionTypePage {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      FunctionTypeBuilder()
    }
    .width('100%')
  }
}
// [End RememberFunctionType]

@Builder
export function rememberFunctionType(): void {
  NavDestination() {
    FunctionTypePage()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.remember_function_type_title'))
}
