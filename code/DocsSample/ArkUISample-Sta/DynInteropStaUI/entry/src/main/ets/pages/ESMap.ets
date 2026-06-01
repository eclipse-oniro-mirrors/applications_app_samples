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

// [Start DynInteropStaESMap]
// entry/src/main/ets/pages/ESMap.ets
import { ESMapChild } from 'static_module';

@Entry
@Component
struct Parent {
  @State data: Map<string, number> = new Map<string, number>([['apple', 1], ['banana', 2]]);

  build() {
    Column() {
      ForEach(Array.from(this.data.entries()), (item: [string, number]) => {
        Text(`${item[0]}: ${item[1]}`)
      })
      Button('Set element')
        .onClick((event: ClickEvent) => {
          this.data.set('orange', 3);
        })
      Button('Reset Map')
        .onClick((event: ClickEvent) => {
          this.data = new Map<string, number>([['strawberry', 4], ['blueberry', 5]]);
        })
      ESMapChild({ data: this.data })
    }
  }
}
// [End DynInteropStaESMap]
