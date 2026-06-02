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
// [Start BuildVariableDeclaration]
import { Column, Component, Entry, Text } from '@kit.ArkUI';

@Entry
@Component
struct MyStateSample {
  build() {
    Column() {
      let num: int = 1; // 在build()根节点中进行变量声明
      Text('show text1')
    }
    .width('100%')
    .height('100%')
  }
}
// [End BuildVariableDeclaration]

@Builder
export function buildVariableDeclaration(): void {
  NavDestination() {
    MyStateSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.build_variable_declaration_title'))
}
