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
// [Start CustomEnvSupportObserveChange]
import { Entry, ComponentV2, Text, Column, Button, CustomEnv, Local, CustomEnvKey } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

const custom = CustomEnvKey.create<string>();

@Entry
@ComponentV2
struct Index {
  @Local customMsg: string = 'Hello';

  build() {
    Column() {
      Button('update')
        .onClick(() => {
          this.customMsg = 'Hello World';
        })

      WithEnv() {
        // 有WithEnv组件，显示this.customMessage的默认值'Hello'，点击Button后值更新为'Hello World'。
        Child()
      }.customEnv(custom, this.customMsg)

    }
  }
}

@ComponentV2
struct Child {
  @CustomEnv('custom') customMessage: string = 'default content';

  build() {
    Column() {
      Text(`Child: ${this.customMessage}`);
    }
  }
}

// [End CustomEnvSupportObserveChange]
@Builder
export function localArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.ce_observe_change_title'))
}