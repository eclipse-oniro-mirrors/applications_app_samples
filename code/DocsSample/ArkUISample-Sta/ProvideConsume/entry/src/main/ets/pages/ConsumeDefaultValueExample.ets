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
// [Start ConsumeDefaultValueExample]
import { Column, Component, Consume, Entry, State, Text } from '@kit.ArkUI';

@Component
struct Child {
   // 正确用法，指定默认值。
  @Consume info: number = 1;

  build() {
    Text(`info value is ${this.info}`)
  }
}

@Entry
@Component
struct Parent {
  @State message: string = 'Hello';

  build() {
    Column() {
     Text(`Parent message is ${this.message}`)
     Child()
    }
  }
}
// [End ConsumeDefaultValueExample]

@Builder
export function consumeDefaultValueExample(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.consume_default_value_example_title'))
}