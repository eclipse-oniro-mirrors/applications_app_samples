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

// [Start MixCommonV2ToV1]
import { Entry, Text, Column, Component, ComponentV2, Button, ClickEvent, Local, ObjectLink } from '@kit.ArkUI';

class CommonClass {
  name: string = 'Tom';
}

@Entry
@ComponentV2
struct CompV2 {
  @Local commonObject: CommonClass = new CommonClass();

  build() {
    Column() {
      Text(`@Local commonObject: ${this.commonObject.name}`)
      Button('Change object in V2')
        .onClick(() => {
          this.commonObject.name += '!'; // 非Observed/ObservedV2类，组件不刷新
        })
      // @ObjectLink可接收@Observed装饰class的实例
      CompV1({ commonObject: this.commonObject })
    }
  }
}

@Component
struct CompV1 {
  @ObjectLink commonObject: CommonClass;

  build() {
    Column() {
      // 非Observed/ObservedV2类，观察不到变化
      Text(`@ObjectLink commonObject: ${this.commonObject.name}`)
      Button('Change object in V1')
        .onClick(() => {
          this.commonObject.name += '!'; // 非Observed/ObservedV2类，组件不刷新
        })
    }
  }
}
// [End MixCommonV2ToV1]

@Builder
export function mixCommonV2ToV1(): void {
  NavDestination() {
    CompV2()
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.mix_common_v2_to_v1_title'))
}
