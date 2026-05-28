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
// [Start ConsumeNoExternalInit]
import { Column, Component, Consume, Entry, Provide, Text } from '@kit.ArkUI';
@Component
struct Child {
  @Consume num: number;

  build() {
    Column() {
      Text(`num的值: ${this.num}`)
    }
  }
}

@Entry
@Component
struct Parent {
  @Provide num: number = 10;

  build() {
    Column() {
      Text(`num的值: ${this.num}`)
      Child()
    }
  }
}
// [End ConsumeNoExternalInit]

@Builder
export function consumeNoExternalInit(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.consume_no_external_init_title'))
}