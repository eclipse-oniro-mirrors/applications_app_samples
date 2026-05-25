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
// [Start ParamUnionType]
import { Button, ClickEvent, Column, ComponentV2, Entry, Local, Param, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  @Local count: number | null = 0;

  build() {
    Column() {
      MyComponent({ count: this.count })
      Button('change')
        .onClick((e: ClickEvent) => {
          // 将count从number变为null，类型变化可观察到，UI会刷新
          this.count = null;
        })
    }
  }
}

@ComponentV2
struct MyComponent {
  @Param count: number | null = 0;

  build() {
    Column() {
      Text(`count(${this.count})`)
    }
  }
}

// [End ParamUnionType]

@Builder
export function paramUnionType(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.param_union_type_title'))
}