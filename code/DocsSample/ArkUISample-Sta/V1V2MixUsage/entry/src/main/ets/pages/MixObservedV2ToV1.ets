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

// [Start MixObservedV2ToV1]
import { Entry, Text, Column, Component, ComponentV2, ClickEvent, Local, ObjectLink, Observed, Track, Button } from '@kit.ArkUI';

@Observed
class ObservedClass {
  @Track name: string = 'a';
  count: number = 0;
}

@Entry
@ComponentV2
struct CompV2 {
  @Local observedClass: ObservedClass = new ObservedClass();

  build() {
    Column() {
      Button(`name V2: ${this.observedClass.name}`)
        .width(300)
        .margin(10)
        .onClick(() => {
          // 触发刷新
          this.observedClass.name += 'a';
        })
      // 使用非@Track的变量在V2中不会崩溃，但不触发刷新
      Button(`count V2: ${this.observedClass.count}`)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.observedClass.count++;
        })

      CompV1({ observedClass: this.observedClass })
    }
    .width('100%')
  }
}

@Component
struct CompV1 {
  @ObjectLink observedClass: ObservedClass;

  build() {
    Column() {
      Button(`name V1: ${this.observedClass.name}`)
        .width(300)
        .margin(10)
        .onClick(() => {
          // 触发刷新
          this.observedClass.name += 'a';
        })
      // 使用非@Track的变量在V1中会崩溃
      // Text(`count V1: ${this.observedClass.count}`)
    }
    .width('100%')
  }
}
// [End MixObservedV2ToV1]

@Builder
export function mixObservedV2ToV1(): void {
  NavDestination() {
    CompV2()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_observed_v2_to_v1_title'))
}
