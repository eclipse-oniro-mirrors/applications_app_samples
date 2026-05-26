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
// [Start StateObservedClass]
import { Button, Column, ColumnOptions, Component, Entry, Observed, State, Text } from '@kit.ArkUI';

@Observed
class ObservedClass {
  value: string = '';
}

class NotObservedClass {
  value: string;
  constructor(value: string) {
    this.value = value;
  }
}

@Entry
@Component
struct Index {
  @State observedClass: ObservedClass = new ObservedClass();
  @State notObservedClass: NotObservedClass = new NotObservedClass('');
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(`Observed class's value is ${this.observedClass.value}`)
      Button('Change observed value')
        .onClick(() => {
          // 修改@Observed类中的属性可以触发UI更新
          this.observedClass.value += '!';
        })
      Text(`Not Observed class's value is ${this.notObservedClass.value}`)
      Button('Change not Observed value')
        .onClick(() => {
          // 修改非@Observed类中的属性不会触发UI更新
          this.notObservedClass.value += 1;
        })
      Button('Change not Observed class')
        .onClick(() => {
          // 整体赋值非@Observed类可以触发UI更新
          this.notObservedClass = new NotObservedClass('NotObservedClass');
        })
    }
    .width('100%')
  }
}
// [End StateObservedClass]

@Builder
export function stateObservedClass(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.state_observed_class_title'))
}