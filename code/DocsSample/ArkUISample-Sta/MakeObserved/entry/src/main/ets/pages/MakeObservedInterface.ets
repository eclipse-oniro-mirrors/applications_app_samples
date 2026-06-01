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
// [Start MakeObservedInterface]
import { ClickEvent, Column, Component, Entry, Text, UIUtils, Button } from '@kit.ArkUI';

interface Info {
  name: string,
  age: int
}

@Entry
@Component
struct Index {
  info: Info = UIUtils.makeObserved({ name: 'Jack', age: 25 } as Info) as Info;

  build() {
    Column() {
      Text(`info.name: ${this.info.name}`)
        .fontSize(20)
        .margin(10)
      Button('change info name')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 由于info变量可深度观察，故该属性变化可触发UI刷新。
          this.info.name = 'Tom';
        })
    }
    .width('100%')
  }
}

// [End MakeObservedInterface]

@Builder
export function makeObservedInterface(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.make_observed_interface_title'))
}