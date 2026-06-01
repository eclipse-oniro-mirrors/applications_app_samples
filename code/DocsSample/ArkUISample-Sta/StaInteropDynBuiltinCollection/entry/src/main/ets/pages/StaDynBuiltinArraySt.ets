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

// [Start StaDynBuiltinArraySt]
// entry/src/main/ets/pages/StaDynBuiltinArraySt.ets

import { ClickEvent, Entry, Column, Button, Component, Text, State } from '@kit.ArkUI';
import { ArrayStChild } from 'dynamic_module';

@Entry
@Component
struct Parent {
  @State data: Array<string> = ['apple', 'banana'];

  build() {
    Column() {
      Text(`Parent data: ${this.data}`)
      Button('Push element')
        .onClick((event: ClickEvent) => {
          this.data.push('orange');
        })
      Button('Reset Array')
        .onClick((event: ClickEvent) => {
          this.data = ['strawberry', 'blueberry'];
        })
      ArrayStChild({ data: this.data })
    }
  }
}
// [End StaDynBuiltinArraySt]
