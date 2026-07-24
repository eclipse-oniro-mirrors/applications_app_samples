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
// [Start CustomEnvSupportUseWatchDecorator]
import {
  Entry, Component, Column, Text, Button, CustomEnv, CustomEnvKey, Watch, State, Row
} from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

const custom = CustomEnvKey.create<string>();

@Entry
@Component
struct Index {
  @State defaultMessage: string = 'the nearest WithEnv';

  build() {
    Row() {
      Column() {
        Text(`Index message is : ${this.defaultMessage}`)
        WithEnv() {
          Child()
        }.customEnv(custom, this.defaultMessage)

        Button('change')
          .onClick(() => {
            // 点击Button后，this.defaultMessage的值会更新为'Hello World'，触发@Watch监听回调。
            this.defaultMessage = 'Hello World';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  // @CustomEnv与@Watch装饰器联用，监听变量变化。
  @CustomEnv('custom') @Watch('onChange') message: string = "Hello";
  // 当message变量值发生变化时会触发@Watch监听回调。
  onChange(propName: string): void {
    console.info(`[CustomEnv], this.message: ${this.message} has changed!`);
  }

  build() {
    Text("Child message is :" + this.message)
  }
}

// [End CustomEnvSupportUseWatchDecorator]
@Builder
export function localArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_use_watch_title'))
}