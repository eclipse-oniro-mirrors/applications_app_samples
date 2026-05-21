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
// [Start ComputedComponent]
import { Button, ClickEvent, Column, ComponentV2, Computed, Divider, Entry, Local, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  @Local firstName: string = 'Li';
  @Local lastName: string = 'Hua';
  age: number = 20; // 无法触发Computed

  @Computed
  get fullName(): string {
    console.info('---------Computed----------');
    return this.firstName + ' ' + this.lastName + this.age;
  }

  build() {
    Column() {
      Text(this.lastName + ' ' + this.firstName)
      Text(this.lastName + ' ' + this.firstName)
      Divider()
      Text(this.fullName)
      Text(this.fullName)
      Button('changed lastName').onClick((e: ClickEvent) => {
        this.lastName += 'a';
      })

      Button('changed age').onClick((e: ClickEvent) => {
        this.age++;  // 无法触发Computed
      })
    }
  }
}

// [End ComputedComponent]

@Builder
export function computedComponent(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.computed_component_title'))
}