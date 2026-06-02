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
// [Start WrapBuilderReference]
import { Builder, Button, ClickEvent, Column, Component, Entry, Text, WrappedBuilder, wrapBuilder, Observed, State } from '@kit.ArkUI';

interface Tmp {
  paramA2: string;
}

@Builder
function overBuilder(param: Tmp) {
  Column() {
    Text(`wrapBuilder value: ${param.paramA2}`)
  }.width('100%')
}

const wBuilder: WrappedBuilder<@Builder (param: Tmp) => void> = wrapBuilder(overBuilder);

@Entry
@Component
struct Parent{
  @State label: string = 'Hello';
  build() {
    Column() {
      wBuilder.builder({ paramA2: this.label })
      Button('Click me')
        .onClick(() => {
          this.label += '!';
        })
    }.width('100%')
  }
}

// [End WrapBuilderReference]

@Builder
export function wrapBuilderReference(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.wrapbuilder_reference_title'))
}
