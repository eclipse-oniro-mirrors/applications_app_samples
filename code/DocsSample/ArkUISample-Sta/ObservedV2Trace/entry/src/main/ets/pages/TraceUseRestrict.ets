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
// [Start TraceUseRestrict]
import { Column, ComponentV2, Entry, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Person {
  id: number = 0;
  @Trace age: number = 8;
}

@Entry
@ComponentV2
struct Index {
  person: Person = new Person();

  build() {
    Column() {
      // age被@Trace装饰，用在UI中可以触发UI刷新
      Text(`${this.person.age}`)
        .onClick((e) => {
          this.person.age++; // 点击会触发UI刷新
        })
      // id未被@Trace装饰，用在UI中不会触发UI刷新
      Text(`${this.person.id}`) // 当id变化时不会刷新
        .onClick((e) => {
          this.person.id++; // 点击不会触发UI刷新
        })
    }
  }
}

// [End TraceUseRestrict]

@Builder
export function traceUseRestrict(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_use_restrict_title'))
}