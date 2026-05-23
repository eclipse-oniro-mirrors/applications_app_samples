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
// [Start ComputedObservedV2]
import { Button, ClickEvent, Column, ComponentV2, Computed, Entry, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Name {
  @Trace firstName: string = 'Hua';
  @Trace lastName: string = 'Li';

  @Computed
  get fullName(): string {
    console.info('---------Computed----------');
    return this.firstName + ' ' + this.lastName;
  }
}

const name: Name = new Name();

@Entry
@ComponentV2
struct Index {
  name1: Name = name;

  build() {
    Column() {
      Text(this.name1.fullName)
      Text(this.name1.fullName)
      Button('changed lastName').onClick((e: ClickEvent) => {
        this.name1.lastName += 'a';
      })
    }
  }
}

// [End ComputedObservedV2]

@Builder
export function computedObservedV2(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.computed_observed_v2_title'))
}