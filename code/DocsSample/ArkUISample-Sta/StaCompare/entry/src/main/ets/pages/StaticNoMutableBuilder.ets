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

import { NavDestination, $r, Entry, Builder, ComponentV2, Local, Text, Button, Column } from '@kit.ArkUI';

// [Start static_no_mutable_builder]
import { Entry, Builder, ComponentV2, Local, Text, Button, Column } from '@kit.ArkUI';

@Builder
function textBuilder(p: { text: string }) {
  Text(p.text)
}

@Builder
function buttonBuilder(p: { text: string }) {
  Button(p.text)
}

@Entry
@ComponentV2
struct Index {
  @Local useText: boolean = true;
  @Local message: string = 'init';

  build() {
    Column() {
      // 直接通过条件判断切换@Builder
      if (this.useText) {
        textBuilder({ text: this.message })
      } else {
        buttonBuilder({ text: this.message })
      }
      Button('Switch Builder')
        .onClick(() => {
          this.useText = !this.useText;
        })
    }
  }
}
// [End static_no_mutable_builder]

@Builder
export function staticNoMutableBuilderBuilder(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.static_no_mutable_builder_title'))
}
