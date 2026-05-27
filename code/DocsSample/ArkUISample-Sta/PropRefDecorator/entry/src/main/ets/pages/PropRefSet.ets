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
// [Start PropRefSet]
import { Button, ClickEvent, Column, Component, Entry, PropRef, State, Text } from '@kit.ArkUI';
@Entry
@Component
struct Index {
  @State set: Set<int> = new Set<int>([0, 1, 2, 3, 4]);
  build() {
    Column() {
      Child({ set: this.set })
    }
  }
}
@Component
struct Child {
  @PropRef set: Set<int>;
  build() {
    Column() {
      Text(`${this.set}`)
      Button('init set').onClick((e: ClickEvent) => {
        this.set = new Set<int>([0, 1, 2, 3, 4]);
      })
      Button('set new one').onClick((e: ClickEvent) => {
        this.set.add(5);
      })
      Button('clear').onClick((e: ClickEvent) => {
        this.set.clear();
      })
      Button('delete the first one').onClick((e: ClickEvent) => {
        this.set.delete(0);
      })
    }
  }
}
// [End PropRefSet]

@Builder
export function propRefSet(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_set_title'))
}