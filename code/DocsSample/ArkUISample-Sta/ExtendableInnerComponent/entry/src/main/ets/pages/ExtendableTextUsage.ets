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
// [Start extendable_text_usage]
import { ExtendableText, TextOptions, Length, Entry, Component, Text, Column } from '@kit.ArkUI';

class MyText extends ExtendableText {
  // Text中的属性
  fontSize(): this {
    super.fontSize(30);
    return this;
  }

  // 通用属性
  width(): this {
    super.width('100%');
    return this;
  }
}

@Entry
@Component
struct ExtendableTextUsageExample {
  build() {
    Column() {
      MyText('Hello World')
        .fontSize()
        .height('30%')
        .width()
    }
  }
}
// [End extendable_text_usage]

@Builder
export function extendableTextUsage(): void {
  NavDestination() {
    ExtendableTextUsageExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.extendable_text_usage_title'))
}
