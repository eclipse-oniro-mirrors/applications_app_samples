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
// [Start WrapBuilderForEach]
import { Builder, Color, Column, Component, Entry, ForEach, Row, Text, WrappedBuilder, wrapBuilder, State } from '@kit.ArkUI';

@Builder
function MyBuilder(value: string, size: number) {
  Text(value)
    .fontSize(size)
}

@Builder
function YourBuilder(value: string, size: number) {
  Text(value)
    .fontSize(size)
    .fontColor(Color.Pink)
}

// 使用wrapBuilder封装@Builder函数列表，包含的@Builder函数需要有相同的签名
const builderArr: WrappedBuilder<@Builder (p1: string, p2: number) => void>[] = [wrapBuilder(MyBuilder), wrapBuilder(YourBuilder)];


@Entry
@Component
struct Index {
  @Builder
  testBuilder() {
    // 使用ForEach展开WrappedBuilder列表
    ForEach(builderArr, (item: WrappedBuilder<@Builder (p1: string, p2: number) => void>) => {
      item.builder('Hello World', 30)
    })
  }

  build() {
    Row() {
      Column() {
        this.testBuilder()
      }
      .width('100%')
    }
    .height('100%')
  }
}

// [End WrapBuilderForEach]

@Builder
export function wrapBuilderForEach(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.wrapbuilder_foreach_title'))
}
