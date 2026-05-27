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
// [Start PropRefParentChild]
import { Button, ClickEvent, Column, Component, Entry, PropRef, State, Text } from '@kit.ArkUI';
@Entry
@Component
struct Index {
  @State count: number = 0;
  build() {
    Column() {
      Text(`State ${this.count}`)
      Button('change State')
        .onClick((e: ClickEvent) => {
          // 对数据源的更改会同步给子组件
          this.count++;
      })
      Child({ count: this.count })
    }
  }
}
@Component
struct Child {
  @PropRef count: number;
  build() {
    Column() {
      Text(`PropRef ${this.count}`)
      Button('change PropRef')
        .onClick((e: ClickEvent) => {
          this.count++;
        })
    }
  }
}
// [End PropRefParentChild]

@Builder
export function propRefParentChild(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_parent_child_title'))
}