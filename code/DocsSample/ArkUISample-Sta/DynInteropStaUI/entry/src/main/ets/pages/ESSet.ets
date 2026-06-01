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

// [Start DynInteropStaESSet]
// entry/src/main/ets/pages/ESSet.ets
import { ESSetChild } from 'static_module';

@Entry
@Component
struct Parent {
  @State data: Set<string> = new Set<string>(['apple', 'banana']);

  build() {
    Column() {
      ForEach(Array.from(this.data.values()), (item: string) => {
        Text(item)
      })
      Button('Add element')
        .onClick((event: ClickEvent) => {
          this.data.add('orange');
        })
      Button('Reset Set')
        .onClick((event: ClickEvent) => {
          this.data = new Set<string>(['strawberry', 'blueberry']);
        })
      ESSetChild({ data: this.data })
    }
  }
}
// [End DynInteropStaESSet]
