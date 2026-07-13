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
// [Start BuilderCallInWatch]
import { Entry, Component, Provide, Watch, Builder, Row, Text, Column, Button, ColumnOptions } from '@kit.ArkUI';

@Entry
@Component
struct Child2 {
  // 使用@Provide和@Watch装饰器，当content变化时触发provideWatch回调
  @Provide @Watch('provideWatch') content: string = 'Index: hello world';

  @Builder
  watchBuilder(content: string) {
    Row() {
      Text(`${content}`)
    }
  }

  // @Watch回调函数
  provideWatch(name: string) {
    // 正确写法，不在@Watch函数中使用@Builder函数
    console.info(`content value has changed.`);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button(`content value: ${this.content}`)
        .onClick(() => {
          // 点击按钮修改content，触发@Watch回调
          this.content += '_world';
        })
      this.watchBuilder(this.content);
    }
    .width('100%')
  }
}
// [End BuilderCallInWatch]

@Builder
export function builderCallInWatch(): void {
  NavDestination() {
    Child2();
  }
  .backgroundColor('#f1f2f3')
}
